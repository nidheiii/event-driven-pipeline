import boto3
import csv
import datetime

dynamodb = boto3.resource('dynamodb')
s3 = boto3.client('s3')

TABLE_NAME = "ProcessedEvents"
REPORT_BUCKET = "event-pipeline-reports-nidheiii-001"

def lambda_handler(event, context):
    table = dynamodb.Table(TABLE_NAME)
    response = table.scan()

    today = str(datetime.date.today())
    file_name = f"daily-report-{today}.csv"
    path = f"/tmp/{file_name}"

    with open(path, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["eventDate", "eventId", "source"])
        for item in response["Items"]:
            writer.writerow([
                item.get("eventDate"),
                item.get("eventId"),
                item.get("source")
            ])

    s3.upload_file(path, REPORT_BUCKET, file_name)
    return {"report": "generated"}
