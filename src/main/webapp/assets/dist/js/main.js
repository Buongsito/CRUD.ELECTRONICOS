
const findAll = () =>{
    $.ajax({

        type: 'GET',
        url: 'http://localhost:8080/Wongsito_war/readElectronicos'

    }).done(function (res){

        let List = console.log(res.listElectronicos);
        let ver = "";

    if(List.length > 0){
        let idF = 1;
        for (let mirar of List) {
            ver += `
             <tr>
             <td>${idF}</td>
             <td>${mirar.nombre}</td>
             <td>${mirar.direccionId.calle}, 
                    ${mirar.direccionId.colonia}, 
                    ${mirar.direccionId.postal}, 
                    ${mirar.direccionId.estado}, 
                    ${mirar.direccionId.pais}</td>
             <td>${mirar.fecha}</td>
             <td>${mirar.estado ? `<span class="badge rounded-pill bg-success">Activo</span>` 
                :
                                  `<span class="badge rounded-pill bg-danger">Inactivo</span>`}</td>
             <td>${mirar.estado  ? 
                
                `<button type="button" data-bs-target="#update" onclick="findById('${mirar.id}','1');"> <i class="fas fa-edit"></i>Modificar</button> ` 
                + 
                ` <button  type="button" data-bs-target="#delete" onclick="findById('${mirar.id}','2');"> <i class="fas fa-trash"></i> Eliminar</button>` 
                
                : `<button  type="button" data-bs-target="#details" onclick="findById('${mirar.id}','3');"> <i class="fas fa-edit"></i> >Detalles</button>`}
             </td>
             </tr>        
             `;
            idF++;
        }

    }else{
        ver=`
       <tr>
       <td>No hay Electronicos Rgistrados</td>
       </tr>
       
       `;
    }
    $("#tableElectronicos > tbody").html(content);
    });
}





















const create = () =>{
    let action = 'create';
    let nombre  = document.getElementById("nombre").value;
    let calle = document.getElementById("calle").value;
    let colonia = document.getElementById("colonia").value;
    let postal = document.getElementById("postal").value;
    let estado =  document.getElementById("estado").value;
    let pais = document.getElementById("pais").value;

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/Wongsito_war/createElectronicos',
        data: {
            action: action,
            name:  nombre,
            street: calle,
            suburb: colonia,
            postalCode: postal,
            state: estado,
            country: pais,
        }
    }).done(function(res){
        console.log(res);

        document.getElementById("nombre").value="";
        document.getElementById("calle").value="";
        document.getElementById("colonia").value="";
        document.getElementById("postal").value="";
        document.getElementById("estado").value="";
        document.getElementById("pais").value="";
        $('#create').modal('body');
        findAll();
    });
}



























const findById = (id, coso) => {
    let cases = coso;
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/Wongsito_war/findById',
        data: {
            action: 'findById',
            id: id,
        }
    }).done(function(res){
        let electronico = console.log(res.electronicos);
        if (cases == 1){
            document.getElementById("direccionId1").value=id;
            document.getElementById("id1").value=electronico.direccionId.idAddress;
            document.getElementById("nombre1").value=electronico.nombre;
            document.getElementById("calle1").value=electronico.direccionId.calle;
            document.getElementById("colonia1").value=electronico.direccionId.colonia;
            document.getElementById("postal1").value=electronico.direccionId.postal;
            document.getElementById("estado1").value=electronico.direccionId.estado;
            document.getElementById("pais1").value=electronico.direccionId.pais;
        }else if (cases == 2){
            document.getElementById("id2").value=id;
            document.getElementById("nombre2").innerHTML=electronico.nombre;
        }else if (cases == 3){
            document.getElementById("nombre3").innerHTML=electronico.nombre;
            document.getElementById("calle2").innerHTML=electronico.direccionId.calle;
            document.getElementById("colonia2").innerHTML=electronico.direccionId.colonia;
            document.getElementById("postal2").innerHTML=electronico.direccionId.postal;
            document.getElementById("estado2").innerHTML=electronico.direccionId.estado;
            document.getElementById("pais2").innerHTML=electronico.direccionId.pais;
        }else{
            //Error 404
        }

    });
}


findAll();

















































































/*   ⠄⠄⠄⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄
     ⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄
     ⠄⠄⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄
     ⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄
     ⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰
     ⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤
     ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗
     ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄
     ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄
     ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃⠄
     ⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄
     ⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄⠄
     ⠄⠄⠄⠄⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁⠄⠄⠄⠄⠄
     ⠄⠄⠄⠄⠄⠄⠄⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁⠄⠄⠄⠄⠄⢀⣠⣴
     ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿
     --Wongsito
 */