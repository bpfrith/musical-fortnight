class Images

  def self.corner_pic()
    return ['<img src = "/images/uncle_mark_cartoon.jpg" height = 90px, width = 90px />',
            '<img src = "/images/uncle_mark.jpg" />']
  end

  # def self.corner_pic()
  #   return ["url('https://f4.bcbits.com/img/0006967451_21.jpg')",
  #           "url('https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/13139143_10205939750481735_1914281762343961775_n.jpg?oh=6d5db554c89fe3097f5b7963c74462f9&oe=58F4B4E1' height = 90px, width = 90px)"]
  # end

  # def self.backgrounds()
  #   return ["url('/images/klimaxmusicsystem.jpg')",
  #           "url('/images/turntable.jpg')"]
  # end

  def self.backgrounds()
    return ['<img src = "/images/klimaxmusicsystem.jpg" />',
            '<img src = "/images/turntable.jpg" height = 300px, width = 450/>']
  end
end