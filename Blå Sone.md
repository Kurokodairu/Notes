##### Event flow
1. Network alarm occurs → **Alarm Service** publishes event
2. Ticket Service consumes alarm event → Creates **support** ticket
3. **Ticket Service** publishes ticket created event
4. **Notification Service** consumes ticket event → Sends customer notifications
5. Frontend displays real-time updates

- ticket-service
    - consumer/AlarmEventConsumer.kt: “TODO: TASK 2”
    - producer/TicketEventProducer.kt: “TODO: Task 3”
    - dao/TicketEntity.kt: “TODO: Task 3”
    - dto/TicketEvent.kt: “TODO: Task 3”
    - service/TicketServiceImpl.kt: “TODO: Task 3”
    - test/AlarmToTicketIntegrationTest.kt: “TODO: Remove after TASK 3”
- customer-service
    - controller/CustomerController.kt: “TODO: Task 4”
- frontend
    - src/hooks/useCustomers.ts: “TODO: TASK 5”
- notification-service
    - consumer/TicketEventConsumer.kt: “TODO: TASK 6”
    - service/NotificationServiceImpl.kt: “TODO: TASK 6”
    - producer/NotificationEventProducer.kt: “TODO: TASK 6”
    - dto/NotificationEvent.kt: “TODO: TASK 6”
    - dao/NotificationEntity.kt: “TODO: TASK 6”



Kafka
**Topic** : log, immutable
gets messages, like a temp sensor reading
	topic: temp sensor
		{id:1, temp: 21, location: kitchen}
**Broker** : Servers that store, handle data streaming requests (docker container)
	lives in a kafka cluster
	broker has the partition
	client reads and writes through a broker
**Producer** : responsible for writing data to kafka cluster
	sends messages (key value pairs) into **topics**
	an application that sends data to kafka is a producer
	bootstrap.servers: A list of brokers that the producer can connect to. It only needs a few to discover the rest of the cluster.
	ProducerRecord record = new ProducerRecord<>("**thermostat_readings**", 32, readingAsJson));
			thermostat_readings is the topic, 32 is key, readingAsJson value
**Consumers** : client app, reading data from kafka topics
	