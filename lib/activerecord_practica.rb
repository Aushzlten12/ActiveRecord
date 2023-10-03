require 'sqlite3'
require 'active_record'
require 'byebug'


ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'customers.sqlite3')
# Mostrar consultas en la consola.
# Comenta esta linea para desactivar la visualización de consultas SQL sin formato.
ActiveRecord::Base.logger = Logger.new(STDOUT)

class Customer < ActiveRecord::Base
  def to_s
    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}"
  end

  # NOTA: Cada uno de estos se puede resolver por completo mediante llamadas de ActiveRecord.
  # No deberías necesitar llamar a las funciones de  Ruby para ordenar, filtrar, etc.
  def self.any_candice
    # Tu codigo aqui para devolver todos los clientes cuyo nombre sea Candice
    # p   robablemente algo asi:  Customer.where(....)
    Customer.where(first: 'Candice')
  end
  def self.with_valid_email
    # Tu codigo aqui para devolver solo clientes con direcciones de correo electronico validas (que contengan '@')
    Customer.where("email LIKE '%@%'")
  end

  # etc...
  # Consulta para encontrar clientes con direcciones de correo electrónico válidas
  def self.with_valid_email
    Customer.where("email LIKE '%@%'")
  end
  # Consulta para encontrar clientes con direcciones de correo electrónico que contienen ".org" al final
  def self.with_dot_org_email
    Customer.where("email LIKE '%.org'")
  end

  # Consulta para encontrar clientes con direcciones de correo electrónico no válidas pero que no están en blanco (no contienen "@")
  def self.with_invalid_email
    Customer.where.not("email LIKE '%@%'").where.not(email: '')
  end

  # Consulta para encontrar clientes con direcciones de correo electrónico nulas
  def self.with_blank_email
    Customer.where("email IS NULL")
  end

  # Consulta para encontrar clientes nacidos antes del 1 de enero de 1980
  def self.born_before_1980
    where('birthdate < ?', Date.new(1980, 1, 1))
  end

  # Consulta para encontrar clientes con direcciones de correo electrónico válidas y nacidos antes del 1 de enero de 1980
  def self.with_valid_email_and_born_before_1980
    with_valid_email.born_before_1980
  end

  # Consulta para encontrar clientes cuyos apellidos comienzan con "B" y ordenados por su fecha de nacimiento
  def self.last_names_starting_with_b
    Customer.where("last LIKE 'B%'").order(:birthdate)
  end


  # Método para encontrar los 20 clientes más jóvenes en orden descendente
  def self.twenty_youngest
    order(birthdate: :desc).limit(20)
  end

  # Método para actualizar la fecha de nacimiento de Gussie Murray hasta el 8 de febrero de 2004
  def self.update_gussie_murray_birthdate
    persona = find_by(first: 'Gussie')
    persona.update(birthdate: Time.parse('2004-02-08'))
  end

  # Método para cambiar todos los correos electrónicos no válidos a blanco
  def self.change_all_invalid_emails_to_blank
    where("email IS NOT NULL and email NOT LIKE '%@%'").update_all("email = NULL")
  end

  # Método para eliminar al cliente Meggie Herman de la base de datos
  def self.delete_meggie_herman
    where(first: 'Meggie', last: 'Herman').delete_all
  end

  # Método para eliminar a todos los clientes nacidos antes del 1 de enero de 1978
  def self.delete_everyone_born_before_1978
    where('birthdate < ?', Date.new(1978, 1, 1)).delete_all
  end
end