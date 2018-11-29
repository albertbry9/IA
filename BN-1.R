library(bnlearn)
#cargar la data
data(coronary)
#
bn_df <- data.frame(coronary)
res <- hc(bn_df)
#mostrar la red
plot(res)
#quitar el nexo entre M.Work y Family
res$arcs <- res$arcs[-which((res$arcs[,'from'] == "M..Work" & res$arcs[,'to'] == "Family")),]
#calcular las CPT
fittedbn <- bn.fit(res, data = bn_df)
print(fittedbn$Proteins)
#cual es la probabilidad de que un no-fumador tenga un nivel de proteinas menor a 3
cpquery(fittedbn, event = (Proteins=="<3"), evidence = ( Smoking=="no") )
#cual es la probabilidad de que un no-fumador con presion mas alta que 140 tenga un nivel de proteinas menor a 3
cpquery(fittedbn, event = (Proteins=="<3"), evidence = ( Smoking=="no" & Pressure==">140" ) )
#cual es la probabilidad de que alguien con un nivel de proteinas menor a 3 tenga presion mas alta que 140
cpquery(fittedbn, event = (Pressure==">140"), evidence = ( Proteins=="<3" ) )
