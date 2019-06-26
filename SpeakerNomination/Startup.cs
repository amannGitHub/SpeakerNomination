using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SpeakerNomination.Startup))]
namespace SpeakerNomination
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
