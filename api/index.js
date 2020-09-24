const url = window.location.toString()?.split('src')[0]+"api/db";

class Api{
    send = async (data_ = {
          table: "",
          method: "",
          data: {
      subQuery: '',
      isJoin: false,
      graph: false,
      query:'',
      fieldSearch:'',
      id: 0,
      field:'',
      leftJoin:false,
      moreTable:'',
      allPage:false,
      search:'',
      username:'',
      password:''
    }})=>{
      let { table, method, data }= data_;
      
       let formData = new FormData();
       if(data)
       for (let key in data) {

         if (typeof data[key] == 'object' && data[key]) {

           if (data[key].length) {

             let i = 0;
             for (let item of data[key]) {
               formData.append(key + "," + i, item);
               i++;
             }

           } else {
             formData.append(key, data[key]);
           }
         } else {
           formData.append(key, data[key]);
         }  
    }
    let result = await fetch(url + `/${table}/${method}`, {
      method: 'POST',
      body: formData
    });

    return await result.json();
  }
  filePath = () => url+`/upload/`
}