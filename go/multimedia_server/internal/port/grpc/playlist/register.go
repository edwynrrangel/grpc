package playlist

import (
	"go.mongodb.org/mongo-driver/mongo"
	"google.golang.org/grpc"

	"github.com/edwynrrangel/grpc/go/multimedia_server/config"
	playListDomain "github.com/edwynrrangel/grpc/go/multimedia_server/internal/domain/playlist"
	contentRepo "github.com/edwynrrangel/grpc/go/multimedia_server/internal/port/repository/content"
	playListRepo "github.com/edwynrrangel/grpc/go/multimedia_server/internal/port/repository/playlist"
)

func Register(s *grpc.Server, config *config.Config, dbClient *mongo.Client) {
	RegisterPlaylistServiceServer(
		s,
		NewAdapter(
			playListDomain.NewUseCase(
				playListRepo.NewRepository(dbClient, config),
				contentRepo.NewRepository(dbClient, config),
			),
		),
	)
}
