class CrudTable {
  data= []
  readData= true
  columns= []
  rows= []
  form= ``
  title=''
  filter= true
  noBack= true
  action = {}
  
  selected = {}

  init(data,form,title,noBack,action){
      this.data = data
      this.form = form
      this.title = title
      this.noBack = noBack
      this.action = action

      return this.getTableStruct()
  }
  TableHeader(){
    let header = ''
    this.columns.map((value) => {
      header += `<th>${value}</th>`
    })

    console.log('here->',header)

    return header
  }
  getTableStruct(){
        if(this.data?.length>0){
          this.columns = []
          this.rows = []

          let columnsList = {}
          this.rows = this.data.map(element => {
            for (const title in element) columnsList[title] = title
            return element
          });
          for (const key in columnsList) this.columns.push(key)
        }
        return this.render()
  }
  TableBodyRows = (value) =>{
      let res = this.columns.map((colname)=>{
                let out = value[colname]
                    if ((typeof (value[colname]) !== 'object')){
                        if((colname.toLowerCase() === 'valor')){
                            out = out+',00'
                             return(`
                                <td typeof=${typeof (value[colname])} style="letterSpacing:'1px',color: '#2E71DC',fontWeight:'bold'">${out}</td>
                            `)
                        }


                        return(`
                            <td typeof=${typeof (value[colname])}>${out}</td>
                        `)
                    }else{
                        if((colname.toLowerCase() === 'tamanhos' || colname.toLowerCase() === 'contactos')){
                            out = value[colname]
                             return(`
                                    <td typeof='string'>${out.join(', ')}</td>
                                `)
                        }
                        return(`
                            <td typeof=${typeof (value[colname])}>-</td>
                        `)
                    }
                })
      let body = ''
      res.map((row)=>{
        body += row
      })
      return body
    }
  alertFunction(){
    alert('ola mundo')
  }
  TableBody = () =>{
      return(
          this.rows.map((value,index)=>{
              return(`
                  <tr>
                      <td style="width: '50px'">
                          <input type="checkbox" onChange="${this.action.onDelete('ola mundo')}"/>
                      </td>
                      ${this.TableBodyRows(value)}
                  </tr>
              `)
          })
      )
  }
  Table(){
        return(`
               ola
      `)
    }
  render() {
    return (`
        <div class="CrudTable">
            <div class="CrudTable__formContent">
                <div>
                    ${
                        !this.noBack ? (`
                            <a href="/">
                                <strong class="CrudTable__formContent--title"><i class="fas fa-arrow-left"/> ${this.title}</strong>
                            </a>
                        `) : (`
                            <strong class="CrudTable__formContent--title">${this.title}</strong>
                        `)
                    }
                </div>
               <div>
                    ${this.form}
               </div>
            </div>
                    ${
                        this.data?.length > 0 ? (`
                                <div>
                                        <nav class="CrudTable__nav">
                                            <div class="search">
                                        <input type="text" name="#" id="#" onChange="({target:{value}})=>{
                                            let data = this.state.data.filter((item) => {
                                                return this.state.columns.map((columns) => {
                                                    if (item[columns]?.toString().toLowerCase().indexOf(value.toLowerCase()) > -1) return true
                                                    else return false
                                                }).indexOf(true)>-1 ? true : false
                                            })
                                            if(data.length>0)
                                                this.setState({ data,filter: true },()=>{
                                                    this.getTableStruct()
                                                })
                                            else
                                                this.setState({filter: false})
                                    }" class="search_input" placeholder="Encontrar ${[...this?.columns][0]}, ${[...this?.columns][1] !== undefined ? [...this?.columns][1] : ''}..."/>
                                        <button class="search_button">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                    <div>
                                        <button onClick="()=>{
                                            this.onDelete(this.selected)
                                        }}">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                        <button>
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </div>
                                </nav>
                                <div class="CrudTable__container">
                                    ${this.Table()}
                                </div>
                            </div>
                        `) : (`
                             <small style="color: '#ccc'">Tabela vazia, adicione dados para poder visualizar</small>
                        `)
                    }
                    
        </div>
    `)
  }
}
