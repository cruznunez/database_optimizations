class ReportsController < ApplicationController
  def all_data
    @assembly = Assembly.find_by_name(params[:name])

    @hits = Hit.where( subject_id: Gene.where( sequence_id: Sequence.where(
        assembly_id: Assembly.where( name: params[:name] )))).order( :percent_similarity )
  end

  def email
    @choices = Assembly.all.map {|a| a.name}
  end

  def confirmation
    @email = params[:email]
    @name = params[:name]
  end
end
