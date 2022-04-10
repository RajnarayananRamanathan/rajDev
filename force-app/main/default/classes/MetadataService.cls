public class MetadataService {
    
    public static String SOAP_M_URI = 'http://soap.sforce.com/2006/04/metadata';
    
    public class MetadataPort {
        public String endpoint_x = URL.getOrgDomainUrl().toExternalForm() + '/services/Soap/m/42.0';
        
        public MetadataService.SessionHeader_element SessionHeader;       
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        
        private String[] ns_map_type_info = new String[]{SOAP_M_URI, 'MetadataService'};  
            
            public MetadataService.IReadResult readMetadata(String type_x,String[] fullNames) {
                system.debug('type_x--'+type_x);
                system.debug('fullNames--'+fullNames);
                MetadataService.readMetadata_element request_x = new MetadataService.readMetadata_element();
                request_x.type_x = type_x;
                request_x.fullNames = fullNames;
                MetadataService.IReadResponseElement response_x;
                Map<String, MetadataService.IReadResponseElement> response_map_x = new Map<String, MetadataService.IReadResponseElement>();
                response_map_x.put('response_x', response_x);
                WebServiceCallout.invoke(
                    this,
                    request_x,
                    response_map_x,
                    new String[]{endpoint_x,
                        '',
                        SOAP_M_URI,
                        'readMetadata',
                        SOAP_M_URI,
                        'readMetadataResponse',
                        'MetadataService.read' + type_x + 'Response_element'}
                );
                response_x = response_map_x.get('response_x');
                system.debug('response_x--'+response_x);
                return response_x.getResult();
            }
    }
    
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'sessionId'};
                    }                      
    
    public virtual class Metadata {
        public String fullName;
    }
    
    public class RecordType extends Metadata {
        public String type = 'RecordType';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
            public Boolean active;
        public String businessProcess;
        public String compactLayoutAssignment;
        public String description;
        public String label;
        public MetadataService.RecordTypePicklistValue[] picklistValues;
        private String[] active_type_info = new String[]{'active',SOAP_M_URI,null,'1','1','false'};
            private String[] businessProcess_type_info = new String[]{'businessProcess',SOAP_M_URI,null,'0','1','false'};
                private String[] compactLayoutAssignment_type_info = new String[]{'compactLayoutAssignment',SOAP_M_URI,null,'0','1','false'};
                    private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
                        private String[] label_type_info = new String[]{'label',SOAP_M_URI,null,'1','1','false'};
                            private String[] picklistValues_type_info = new String[]{'picklistValues',SOAP_M_URI,null,'0','-1','false'};
                                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                    private String[] type_att_info = new String[]{'xsi:type'};
                                        private String[] field_order_type_info = new String[]{'fullName', 'active','businessProcess','compactLayoutAssignment','description','label','picklistValues'};
                                            }
    
    public class RecordTypePicklistValue {
        public String picklist;
        public MetadataService.PicklistValue[] values;
        private String[] picklist_type_info = new String[]{'picklist',SOAP_M_URI,null,'1','1','false'};
            private String[] values_type_info = new String[]{'values',SOAP_M_URI,null,'0','-1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'picklist','values'};
                        }
    
    public virtual class GlobalPicklistValue extends Metadata {
        public String color;
        public Boolean default_x;
        public String description;
        public Boolean isActive;
    }
    
    public class PicklistValue extends GlobalPicklistValue {
        public String type = 'PicklistValue';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName',SOAP_M_URI,null,'0','1','false'};
            public String color;
        public Boolean default_x;
        public String description;
        public Boolean isActive;
        private String[] color_type_info = new String[]{'color',SOAP_M_URI,null,'0','1','false'};
            private String[] default_x_type_info = new String[]{'default',SOAP_M_URI,null,'1','1','false'};
                private String[] description_type_info = new String[]{'description',SOAP_M_URI,null,'0','1','false'};
                    private String[] isActive_type_info = new String[]{'isActive',SOAP_M_URI,null,'0','1','false'};
                        public Boolean allowEmail;
        public Boolean closed;
        public String[] controllingFieldValues;
        public Boolean converted;
        public Boolean cssExposed;
        public String forecastCategory;
        public Boolean highPriority;
        public Integer probability;
        public String reverseRole;
        public Boolean reviewed;
        public Boolean won;
        private String[] allowEmail_type_info = new String[]{'allowEmail',SOAP_M_URI,null,'0','1','false'};
            private String[] closed_type_info = new String[]{'closed',SOAP_M_URI,null,'0','1','false'};
                private String[] controllingFieldValues_type_info = new String[]{'controllingFieldValues',SOAP_M_URI,null,'0','-1','false'};
                    private String[] converted_type_info = new String[]{'converted',SOAP_M_URI,null,'0','1','false'};
                        private String[] cssExposed_type_info = new String[]{'cssExposed',SOAP_M_URI,null,'0','1','false'};
                            private String[] forecastCategory_type_info = new String[]{'forecastCategory',SOAP_M_URI,null,'0','1','false'};
                                private String[] highPriority_type_info = new String[]{'highPriority',SOAP_M_URI,null,'0','1','false'};
                                    private String[] probability_type_info = new String[]{'probability',SOAP_M_URI,null,'0','1','false'};
                                        private String[] reverseRole_type_info = new String[]{'reverseRole',SOAP_M_URI,null,'0','1','false'};
                                            private String[] reviewed_type_info = new String[]{'reviewed',SOAP_M_URI,null,'0','1','false'};
                                                private String[] won_type_info = new String[]{'won',SOAP_M_URI,null,'0','1','false'};
                                                    private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                                                        private String[] type_att_info = new String[]{'xsi:type'};
                                                            private String[] field_order_type_info = new String[]{'fullName','color','default_x','description','isActive', 'allowEmail','closed','controllingFieldValues','converted','cssExposed','forecastCategory','highPriority','probability','reverseRole','reviewed','won'};
                                                                }
    
    public interface IReadResult {
        MetadataService.Metadata[] getRecords();
    }
    
    public interface IReadResponseElement {
        IReadResult getResult();
    }
    
    public class readRecordTypeResponse_element implements IReadResponseElement {
        public MetadataService.ReadRecordTypeResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result',SOAP_M_URI,null,'1','1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'result'};
                    }
    
    public class ReadRecordTypeResult implements IReadResult {
        public MetadataService.RecordType[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records',SOAP_M_URI,null,'0','-1','false'};
            private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                private String[] field_order_type_info = new String[]{'records'};
                    }
    
    public class readMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new String[]{'type',SOAP_M_URI,null,'1','1','false'};
            private String[] fullNames_type_info = new String[]{'fullNames',SOAP_M_URI,null,'0','-1','false'};
                private String[] apex_schema_type_info = new String[]{SOAP_M_URI,'true','false'};
                    private String[] field_order_type_info = new String[]{'type_x','fullNames'};
                        }
}