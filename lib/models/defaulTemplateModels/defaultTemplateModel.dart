import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';

class DefaultTemplateApiResponse {
   Hackathon hackathons;
   List<Round> rounds;
   List<TextFieldPropertiesArray> fields;
   List<ContainerPropertiesArray> containers;

  DefaultTemplateApiResponse({
    required this.hackathons,
    required this.rounds,
    required this.fields,
    required this.containers,
  });

  factory DefaultTemplateApiResponse.fromJson(Map<String, dynamic> json) => DefaultTemplateApiResponse(
    hackathons: Hackathon.fromJson(json['hackathon']),
    rounds: List<Round>.from(json['round'].map((x) => Round.fromJson(x))),
    fields: List<TextFieldPropertiesArray>.from(json['fields'].map((x) => TextFieldPropertiesArray.fromJson(x))),
    containers: List<ContainerPropertiesArray>.from(json['containers'].map((x) => ContainerPropertiesArray.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'hackathon': hackathons.toJson(),
    'round': rounds.map((x) => x.toJson()).toList(),
    'fields': fields.map((x) => x.toJson()).toList(),
    'containers': containers.map((x) => x.toJson()).toList(),
  };
}