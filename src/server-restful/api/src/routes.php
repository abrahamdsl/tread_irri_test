<?php
// Routes

$app->get('/welcome/[{name}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});


// *COUNTRY
$app->get('/country', function($request, $response, $args) {
  $sth = $this->db->prepare("SELECT * FROM country ORDER BY country_shorthand");

  $sth->execute();
  $todos = $sth->fetchAll();
  return $this->response->withJson( $todos );
});

$app->get('/country/[{query}]', function ($request, $response, $args) {
  $sth = $this->db->prepare("SELECT * FROM country WHERE country_id=:query");
  $sth->bindParam("query",$args['query']);
  $sth->execute();
  $todos = $sth->fetchObject();

  return $this->response->withJson($todos);
});
// *conclude COUNTRY

// *CROP
$app->get('/crop', function($request, $response, $args) {
  $sth = $this->db->prepare("SELECT * FROM crop ORDER BY crop_id");
  $sth->execute();
  $todos = $sth->fetchAll();
  return $this->response->withJson( $todos );
});

$app->get('/crop/[{query}]', function ($request, $response, $args) {
  $sth = $this->db->prepare("SELECT * FROM crop WHERE crop_id=:query");
  $sth->bindParam("query",$args['query']);
  $sth->execute();
  $todos = $sth->fetchObject();

  return $this->response->withJson($todos);
});

 $app->post('/crop', function ($request, $response) {
        $input = $request->getParsedBody();
        $sql = "INSERT INTO crop (crop_id, friendly_name) VALUES (:crop_id, :friendly_name)";
        $sth = $this->db->prepare($sql);
				
	$spacing = $input['friendly_name'];
	$spacing = strtolower($spacing);
	$spacing = preg_replace('/\s+/', '_', $spacing); // remove spaces
echo $spacing;				
        $sth->bindParam("crop_id", $spacing);
	$sth->bindParam("friendly_name", $input['friendly_name']);
        $sth->execute();
        $input['id'] = $this->db->lastInsertId();
        return $this->response->withJson($input);
    });

 $app->delete('/crop/[{id}]', function ($request, $response, $args) {
         $sth = $this->db->prepare("DELETE FROM crop WHERE crop_id=:id");
        $sth->bindParam("id", $args['id']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });		


// *conclude CROP

// *RECORD 
$app->get('/record', function($request, $response, $args) {
  $sth = $this->db->prepare("SELECT * FROM record ORDER BY record_id");
  $sth->execute();
  $todos = $sth->fetchAll();
  return $this->response->withJson( $todos );
});

$app->get('/record/[{query}]', function ($request, $response, $args) {
  $sth = $this->db->prepare("SELECT * FROM record WHERE record_id=:query");
  $sth->bindParam("query",$args['query']);
  $sth->execute();
  $todos = $sth->fetchObject();
  return $this->response->withJson($todos);
});

 // entry creation
 $app->post('/record', function ($request, $response) {
				$parenth = "";
				$colon = "";
	 
        $input = $request->getParsedBody();
				
				// basic info
				if( isset( $input['record_id'] ) and $input['record_id'] != "" ) {
					$parenth .=  "record_id, " ;
					$colon    .= ":record_id,";				
				}
				if( isset( $input['year'] ) and $input['year'] != "" ) {
					$parenth .=  "year, " ;
					$colon .= ":year, ";
				}
				if( isset( $input['fno'] ) and $input['fno'] != "" ) {
					$parenth .=  "fno, " ;
					$colon .= ":fno, ";
				}
				if( isset( $input['fn'] ) and $input['fn'] != "" ) {
					$parenth .=  "fn, " ;
					$colon .= ":fn, ";
				}
				if( isset( $input['season'] ) and $input['season'] != "" ) {
                                        $parenth .=  "season_id_fk, " ;
                                        $colon .= ":season, ";
                                }
				if( isset( $input['var_name'] ) and $input['var_name'] != "" ) {
					$parenth .=  "var_name, " ;
					$colon .= ":var_name, ";
				}
				
				// location-centric				
				if( isset( $input['country'] ) and $input['country'] != "" ) {
					$parenth .=  "country_id_fk, " ;
					$colon .= ":country, ";
				}
				if( isset( $input['district'] ) and $input['district'] != "" ) {
					$parenth .=  "district, " ;
					$colon .= ":district, ";
				}
				if( isset( $input['village'] ) and $input['village'] != "" ) {
					$parenth .=  "village, " ;
					$colon .= ":village, ";
				}
				if( isset( $input['latitude'] ) and $input['latitude'] != "" ) {
					$parenth .=  "lat, " ;
					$colon .= ":latitude, ";
				}
				if( isset( $input['longitude'] ) and $input['longitude'] != "" ) {
					$parenth .=  "longt, " ;
					$colon .= ":longitude, ";
				}
				if( isset( $input['soil_prop'] ) and $input['soil_prop'] != "" ) {
					$parenth .=  "soil_prop_fk, " ;
					$colon .= ":soil_prop, ";
				}
				
				//experimental details
				if( isset( $input['fa'] ) and $input['fa'] != "" ) {
                                        $parenth .=  "fa, " ;
                                        $colon .= ":fa, ";
                                }
				if( isset( $input['ces'] ) and $input['ces'] != "" ) {
					$parenth .=  "ces, " ;
					$colon .= ":ces, ";
				}
				if( isset( $input['seed_rate'] ) and $input['seed_rate'] != "" ) {
					$parenth .=  "seed_rate, " ;
					$colon .= ":seed_rate, ";
				}
				if( isset( $input['cen_date'] ) and $input['cen_date'] != "" ) {
					$parenth .=  "cen_date, " ;
					$colon .= ":cen_date, ";
				}
				if( isset( $input['ha_date'] ) and $input['ha_date'] != "" ) {
					$parenth .=  "ha_date, " ;
					$colon .= ":ha_date, ";
				}
				if( isset( $input['pre_crop'] ) and $input['pre_crop'] != "" ) {
					$parenth .=  "pre_crop, " ;
					$colon .= ":pre_crop, ";
				}
				if( isset( $input['fallow_period'] ) and $input['fallow_period'] != "" ) {
					$parenth .=  "fallow_period, " ;
					$colon .= ":fallow_period, ";
				}
				if( isset( $input['yield'] ) and $input['yield'] != "" ) {
					$parenth .=  "yield, " ;
					$colon .= ":yield, ";
				}
				//now prepare SQL statement

	$parenth = preg_replace( '/\,\s+$/', '', $parenth);
        $colon = preg_replace( '/\,\s+$/', '', $colon);

        $sql = "INSERT INTO record ($parenth) VALUES ($colon)";
        $sth = $this->db->prepare($sql);
	 error_log(print_r($sql, true)); 
				//now bind parameters
				// basic info
				if( isset( $input['record_id'] ) and $input['record_id'] != "" ) {			
					$sth->bindParam('record_id', $input['record_id']);
				}
				if( isset( $input['year'] ) and $input['year'] != "" ) {					
					$sth->bindParam('year', $input['year']);
				}
				if( isset( $input['fno'] ) and $input['fno'] != "" ) {					
					$sth->bindParam('fno', $input['fno']);
				}
				if( isset( $input['fn'] ) and $input['fn'] != "" ) {					
					$sth->bindParam('fn', $input['fn']);
				}
				if( isset( $input['season'] ) and $input['season'] != "" ) {                                
                                        $sth->bindParam('season', $input['season']);
                                }
				if( isset( $input['var_name'] ) and $input['var_name'] != "" ) {					
					$sth->bindParam('var_name', $input['var_name']);
				}
				
				// location-centric				
				if( isset( $input['country'] ) and $input['country'] != "" ) {				
					$sth->bindParam('country', $input['country']);
				}
				if( isset( $input['district'] ) and $input['district'] != "" ) {					
					$sth->bindParam('district', $input['district']);
				}
				if( isset( $input['village'] ) and $input['village'] != "" ) {					
					$sth->bindParam('village', $input['village']);
				}
				if( isset( $input['latitude'] ) and $input['latitude'] != "" ) {					
					$sth->bindParam('latitude', $input['latitude']);
				}
				if( isset( $input['longitude'] ) and $input['longitude'] != "" ) {					
					$sth->bindParam('longitude', $input['longitude']);
				}
				if( isset( $input['soil_prop'] ) and $input['soil_prop'] != "" ) {					
					$sth->bindParam('soil_prop', $input['soil_prop']);
				}
				
				//experimental details
				if( isset( $input['fa'] ) and $input['fa'] != "" ) {
                                        $sth->bindParam('fa', $input['fa']);
                                }
				if( isset( $input['ces'] ) and $input['ces'] != "" ) {				
					$sth->bindParam('ces', $input['ces']);
				}
				if( isset( $input['seed_rate'] ) and $input['seed_rate'] != "" ) {					
					$sth->bindParam('seed_rate', $input['seed_rate']);
				}
				if( isset( $input['cen_date'] ) and $input['cen_date'] != "" ) {					
					$sth->bindParam('cen_date', $input['cen_date']);
				}
				if( isset( $input['ha_date'] ) and $input['ha_date'] != "" ) {				
					$sth->bindParam('ha_date', $input['ha_date']);
				}
				if( isset( $input['pre_crop'] ) and $input['pre_crop'] != "" ) {					
					$sth->bindParam('pre_crop', $input['pre_crop']);
				}
				if( isset( $input['fallow_period'] ) and $input['fallow_period'] != "" ) {
					$sth->bindParam('fallow_period', $input['fallow_period']);
				}
				if( isset( $input['yield'] ) and $input['yield'] != "" ) {					
					$sth->bindParam('yield', $input['yield']);
				}
				
				// now execute query
        $sth->execute();
        $input['id'] = $this->db->lastInsertId();
				
        return $this->response->withJson($input);
    });


 $app->delete('/record/[{id}]', function ($request, $response, $args) {
         $sth = $this->db->prepare("DELETE FROM record WHERE record_id=:id");
        $sth->bindParam("record_id", $args['id']);
        $sth->execute();
        $todos = $sth->fetchAll();
        return $this->response->withJson($todos);
    });
// *conclude RECORD



