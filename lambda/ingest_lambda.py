import boto3
import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ProcessedEvents')

def lambda_handler(event, context):
    for record in event['Records']:
        table.put_item(
            Item={
                "eventDate": str(datetime.date.today()),
                "eventId": record["responseElements"]["x-amz-request-id"],
                "source": "S3 Upload"
            }
        )
    return {"status": "success"}
