require_relative 'client'

module TimepadApi
  class OrderStatus
    OK = 'ok' #(ок): бесплатный билет успешно заказан
    PAID = 'paid' #(оплачено): платный билет успешно оплачен он-лайн
    BOOKED = 'booked' #(забронировано): билет находится в статусе "Забронировано"
    NOTPAID = 'notpaid' #(просрочено): билет не был оплачен и срок брони для него истек
    INACTIVE = 'inactive' #(отказ): участник отказался от участия
    DELETED = 'deleted' #(удалено): организатор удалил билет
    RETURNED = 'returned' #(возврат): участнику были возвращены деньги за билет
    PENDING = 'pending' #(заявка рассматривается): заявка на участие в событии находится на рассмотрении
    REJECTED = 'rejected' #(отклонено): заявка на участие в событии была отклонена
    BOOKED_OFFLINE = 'booked_offline' #(бронь для выкупа): билет был заказан для выкупа в офисе организатора
    PAID_OFFLINE = 'paid_offline' #(оплачено на месте): билет был оплачен в офисе организатора
    ACTIVE_STATUSES = ['ok', 'paid', 'booked', 'pending', 'booked_offline', 'paid_offline']

    # Is status active?
    #
    # @params [String] status
    # @return [Boolean]
    def self.active?(status)
      OrderStatus::ACTIVE_STATUSES.include?(status)
    end
  end

  class Order
    def initialize(timepad_client)
      @client = timepad_client
    end

    # Get event orders
    #
    # @params [String] event_id
    # @return [Array]
    def list(event_id, attrs = nil)
      response = @client.request "events/#{event_id}/orders", attrs
    end
  end
end
