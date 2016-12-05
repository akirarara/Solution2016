class RoomsController < ApplicationController
  def show
    @messages = Message.all
    
    case Message.all.count
    when 0
      qcounts = 0
    when 1,2
      qcounts = Message.all.where("(content LIKE ?) OR (content LIKE ?)", '%?%', '%？%').count
    else
      maxid = Message.maximum('id') # 直近のレコードを調べるため、id が大きいものを調べる。
    
      if Message.all.where("(id = ?) OR (id = ?)" , maxid - 1, maxid).where("(content LIKE ?) OR (content LIKE ?)", '%?%', '%？%').count == 2
        if Message.all.where("id = ?" , maxid - 2).where("(content LIKE ?) OR (content LIKE ?)", '%?%', '%？%').count == 1
          qcounts = 3 # 連続して質問が３つ続いた場合。
        else
        qcounts = 2 # 連続して質問が２つ続いた場合。
        end
      else
        qcounts = 1
      end
        
    end

    case qcounts
    when 0, 1
      @results = "ここにメッセージを書いてください。"
    when 2
      @results = "２つの質問が続いています。"
    when 3
      @results = "多くの質問が続いています。"
    end
      
  end
end
