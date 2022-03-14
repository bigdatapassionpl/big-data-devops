from oauthenticator.github import GitHubOAuthenticator


class CustomGitHubOAuthenticatorRadzio(GitHubOAuthenticator):

    async def authenticate(self, handler, data=None):
        print("************************ authenticate")
        print(self)
        print(dir(self))
        print(handler)
        print(dir(handler))
        print(data)
        print(dir(data))
        if data is not None:
            await super().authenticate(self, handler, data)
        else:
            await super().authenticate(handler, self)

    def pre_spawn_start(self, user, spawner):
        print("************************ pre_spawn_start")

        auth_state = yield user.get_auth_state()
        self.log.info('pre_spawn_start auth_state:%s' % auth_state)
        if not auth_state:
            return

        # setup environment
        spawner.environment['NB_USER'] = auth_state['github_user']


c.JupyterHub.authenticator_class = CustomGitHubOAuthenticatorRadzio