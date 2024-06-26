package content

import (
	"go.mongodb.org/mongo-driver/mongo"
	"google.golang.org/grpc"

	"github.com/edwynrrangel/grpc/go/multimedia_server/config"
	contentDomain "github.com/edwynrrangel/grpc/go/multimedia_server/internal/domain/content"
	contentRepo "github.com/edwynrrangel/grpc/go/multimedia_server/internal/port/repository/content"
	"github.com/edwynrrangel/grpc/go/multimedia_server/pkg/bucket"
)

// Register function registers the content service to server gRPC
func Register(s *grpc.Server, config *config.Config, dbClient *mongo.Client, bucketClient bucket.Strategy) {
	RegisterContentServiceServer(
		s,
		NewAdapter(
			contentDomain.NewUseCase(
				bucketClient,
				contentRepo.NewRepository(dbClient, config),
			),
		),
	)
}
