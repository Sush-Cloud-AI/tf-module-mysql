# Injecting the schema into sql database
resource "null_resource" "sqlschema" {
    depends_on = [aws_db_instance.mysql]

provisioner "local-exec" {
    command = <<EOF
        curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
        cd /tmp
        unzip -o mysql.zip
        cd mysql-main
        mysql -h ${aws_db_instance.mysql.address} -u admin1 -p roboshop1 < shipping.sql
    EOF
 

}

}
