db.userAuthorizedLog.find({$and:[{createTime:{$gte:ISODate("2015-06-07T16:00:00.00Z"),$lt:ISODate("2015-06-08T16:00:00.00Z")}},{gwId:{$eq:'001631f1b588'}}]})

db.userAuthorizedLog.find({$and:[{createTime:{$gte:ISODate("2015-06-26T16:00:00.00Z"),$lt:ISODate("2015-06-27T16:00:00.00Z")}},{userType:{$eq:'WECHAT'}}]})

function addFieldWithFieldCheck(){
 	var i=0;
    db.userAuthorizedLog.find({createTime:{$exists:false}}).forEach(function(doc){
    	i++;
         //db.userAuthorizedLog.update({_id:doc._id}, {$set:{"createTime":doc.authorizeTime}});
    });
    print(i);
}

function addFieldWithField(){
    db.userAuthorizedLog.find({createTime:{$exists:false}}).forEach(function(doc){
        db.userAuthorizedLog.update({_id:doc._id}, {$set:{"createTime":doc.authorizeTime}});
    });
}

export
---

	/opt/mongodb/bin/mongoexport -h 112.65.205.87 --port 30000 -d bblinklogs -c userAuthorizedLog -u bblink_logs -p Bblink#2015$ --csv -q '{$and:[{createTime:{$gte:new Date(1435680000000),$lt:new Date(1435766400000)}},{gwId:{$eq:"231cdc76f6fb505e06b5141fec3fc706"}}]}' -f _id,className,userId,gwId,userType,userMac,authorizeTime,createTime -o ~/0630-231cdc76f6fb505e06b5141fec3fc706.csv
