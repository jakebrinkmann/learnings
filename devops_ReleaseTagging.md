[Debian Unstable](https://wiki.debian.org/DebianUnstable) (also known by its codename "Sid") is not strictly a release, but rather a rolling development version of the Debian distribution containing the latest packages that have been introduced into Debian.

  - → experimental
  - → unstable → testing → stable

--

  - Development: AUTO-DEPLOY
  - Staging: X.Y.Z-RC.N
  - Canary: X.Y.Z-beta
  - Production: X.Y.Z

```yaml
stage:deploy: #X.Y.Z-RC.N
  <<: *sam_deploy
  environment:
    name: Staging
  only:
    variables:
      - $CI_COMMIT_TAG =~ /^\d+.\d+.\d+-RC(?:[0-9]+)?$/
  except:
    - branches

canary:deploy: #X.Y.Z-beta
  <<: *sam_deploy
  environment:
    name: Canary
  only:
    variables:
      - $CI_COMMIT_TAG =~ /^\d+.\d+.\d+-beta$/
  except:
    - branches

production:deploy: #X.Y.Z
  <<: *sam_deploy
  environment:
    name: Production
  only:
    variables:
      - $CI_COMMIT_TAG =~ /^\d+.\d+.\d+$/
  except:
    - branches
```

`/tag 0.2.0` message as a comment on a commit will tag in GitLab

As with all Debian release names, Sid takes its name from a ToyStory character. In the movie, Sid is the kid next door who breaks his toys and makes nasty creatures of them.
