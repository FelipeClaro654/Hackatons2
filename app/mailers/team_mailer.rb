class TeamMailer < ApplicationMailer
default from: "hackatons2it@s2.com"
  def confirm(integrante)
    @integrante = integrante
    mail to: @integrante.email, subject: "Confirmação Hackaton!"
  end

end
