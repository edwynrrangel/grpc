package multimedia

import "github.com/edwynrrangel/grpc/go/multimedia/internal/proto"

func ConvertPBSearchRequestToSearchRequest(req *proto.SearchRequest) *SearchRequest {
	return &SearchRequest{
		Query: req.Query,
	}
}

func (c *Content) ToProto() *proto.ContentResponse {
	return &proto.ContentResponse{
		Id:      c.ID,
		Title:   c.Title,
		Genre:   c.Genre,
		Creator: c.Creator,
		Url:     c.Url,
	}
}

func (sr *SearchResponse) ToProto() *proto.SearchResponse {
	var contents []*proto.ContentResponse
	for _, content := range sr.Data {
		contents = append(contents, content.ToProto())
	}

	return &proto.SearchResponse{
		Contents: contents,
	}
}