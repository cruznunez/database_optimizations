class Emailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.emailer.all_data.subject
  #
  def all_data(name, email)
    @assembly = Assembly.find_by_name(name)

    @hits = Hit.where( subject_id: Gene.where( sequence_id: Sequence.where(
        assembly_id: Assembly.where( name: name )))).order( :percent_similarity )


    mail to: "#{email}"
  end
end
