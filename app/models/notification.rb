class Notification < ApplicationRecord
  belongs_to :user

  #0: Llego procedimiento creado al fiscal asignado (a fiscal)
  #1: Fiscal cerró un procedimiento (a carabinero)
  #2: Fiscal solicito más datos respecto a un procedimiento (a carabinero)
  #3: Carabinero respondió con más datos respecto a un procedimiento (a fiscal)
  #4: Has recibido un mensaje

  enum notification_type: {new_procedure: 0, procedure_closed: 1, procedure_requiring_info: 2, procedure_info_updated: 3, new_message: 4}

  def notification_type
    super.to_s.humanize
  end
end
