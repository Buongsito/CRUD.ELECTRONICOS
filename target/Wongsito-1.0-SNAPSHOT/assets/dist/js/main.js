
const findAll = () =>{
    $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/Gadget_war/readGadget'
    }).done(function (res){
        let ListGadget = res.listGadgets;
    let content = "";
    if(ListGadget.length > 0){
        let count = 1;
        for (let gadget of ListGadget) {
            content += `
             <tr>
             <td>${count}</td>
             <td>${gadget.name}</td>
             <td>${gadget.addressId.street}, ${gadget.addressId.suburb}, ${gadget.addressId.postalCode}, ${gadget.addressId.state}, ${gadget.addressId.country}</td>
             <td>${gadget.date}</td>
             <td>${gadget.status ? `<span class="badge rounded-pill bg-success">Activo</span>` : `<span class="badge rounded-pill bg-danger">Inactivo</span>`}</td>
             <td>${gadget.status  ? 
                `<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#update" onclick="findGadgetById('${gadget.idGadget}','1');"> <i class="fas fa-edit"></i> Modificar</button> ` 
                + 
                ` <button  type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete" onclick="findGadgetById('${gadget.idGadget}','2');"><i class="fas fa-trash"></i> Eliminar</button>` 
                : `<button  type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#details" onclick="findGadgetById('${gadget.idGadget}','3');" ><i class="fas fa-info-circle"></i> Detalles</button>`}
             </td>
             </tr>        
             `;
            count++;
        }

    }else{
        content=`
       <tr>
       <td colspan="6" align="center">No hay aparatos electronicos registrados</td>
       </tr>
       
       `;
    }
    $("#tableGadget > tbody").html(content);
    });
}
const create = () =>{
    let action = 'create';
    let name  = document.getElementById("name").value;
    let street = document.getElementById("street").value;
    let suburb = document.getElementById("suburb").value;
    let postalCode = document.getElementById("postalCode").value;
    let state =  document.getElementById("state").value;
    let country = document.getElementById("country").value;
    let date = document.getElementById("date").value;

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/Gadget_war/createGadget',
        data: {
            action: action,
            name:  name,
            street: street,
            suburb: suburb,
            postalCode: postalCode,
            state: state,
            country: country,
            date: date
        }
    }).done(function(res){
        document.getElementById("name").value="";
        document.getElementById("street").value="";
        document.getElementById("suburb").value="";
        document.getElementById("postalCode").value="";
        document.getElementById("state").value="";
        document.getElementById("country").value="";
        document.getElementById("date").value="";
        $('#create').modal('hide');
        findAll();
    });
}
const findGadgetById = (id,type) => {
    let typeCrud = type;
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/Gadget_war/findById',
        data: {
            action: 'findById',
            id: id,
        }
    }).done(function(res){
        let gadget= res.gadget;
        switch(typeCrud){
            case '1':
                document.getElementById("id").value=id;
                document.getElementById("idAddress").value=gadget.addressId.idAddress;
                document.getElementById("name1").value=gadget.name;
                document.getElementById("street1").value=gadget.addressId.street;
                document.getElementById("suburb1").value=gadget.addressId.suburb;
                document.getElementById("postalCode1").value=gadget.addressId.postalCode;
                document.getElementById("state1").value=gadget.addressId.state;
                document.getElementById("country1").value=gadget.addressId.country;
                document.getElementById("date1").value=gadget.date;
                break;
            case '2':
                document.getElementById("id2").value=id;
                document.getElementById("name2").innerHTML=gadget.name;
                break;
            case '3':
                document.getElementById("name3").innerHTML=gadget.name;
                document.getElementById("street2").innerHTML=gadget.addressId.street;
                document.getElementById("suburb2").innerHTML=gadget.addressId.suburb;
                document.getElementById("postalCode2").innerHTML=gadget.addressId.postalCode;
                document.getElementById("state2").innerHTML=gadget.addressId.state;
                document.getElementById("country2").innerHTML=gadget.addressId.country;
                document.getElementById("date2").innerHTML=gadget.date;

                break;
        }
    });
}
findAll();