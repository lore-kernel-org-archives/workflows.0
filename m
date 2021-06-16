Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663C4C48BE6
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1494A6105A
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFPRUX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFPRUX (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 13:20:23 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07741C061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 10:18:16 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id if15so103061qvb.2
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=nYfn5RyDDYHZ3N4Ts2evkCfa9hZNP4QIDZDn6tN8OUU=;
        b=WDP9pc7Iq92LkLWRXdI+nMMsL5SQNhb08ENW7LYavQm6cDcfBNT3Cp4tHvqNabHxra
         EmWbi8H8Yn2GdtzLFHl2Jb3E2Fezo19iQGyP2GXkbFx6J6aJohZVgYnTWUxiCQJvD2qs
         mzM2FTleGh6/2qOXLfrxDTvHTemcPQOkJTI50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=nYfn5RyDDYHZ3N4Ts2evkCfa9hZNP4QIDZDn6tN8OUU=;
        b=dJPVHINsxWke83vS9XzNfXQGwON4tsMF+GOeEDPnaJwy6FEQ9TBf/r4VFhSQfY/apM
         Vv089vhXPJaWHWh3tR76VQ8Ed8HbTHM44E2RwNLIJnCoouKBgXvxHtqQQuNiGLgqoy/J
         6iNnAmHr6lsXo5THQgqJuFIXs/q0D2IBf/oB8SVEboGx4qA7HTd7rNs8HQ44jmFzGuSp
         CkCGGPpnt+X/MIUIdnv5gNfHA1GzUiOwEty/+6S8Ire20JZlUn4GUek1tgcOUSGbTk2N
         reLsWD2O4OiqNNQ9cXtbkFPcKgYfsObKAAYNlO85bM6a7ZLggF8Oa1rqbNxHyxuJ0dOu
         HBGA==
X-Gm-Message-State: AOAM530g0d6JW0S3LJz1HJgIKYHgG+rnCVtJkYLApFFkcbg8brxO6ob3
        EKN9UzUPI+bDCIb56coYLVJO9GEgjGb4DQ==
X-Google-Smtp-Source: ABdhPJzCmlOWqLmrqZ3v42GtvWSzMS55iayXUYlfKU8WXb0eZ6lEaFO5nyPPzesP/XJCzO4Gxtgptw==
X-Received: by 2002:a05:6214:1502:: with SMTP id e2mr1144117qvy.14.1623863895010;
        Wed, 16 Jun 2021 10:18:15 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id x7sm2085069qke.62.2021.06.16.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:18:14 -0700 (PDT)
Date:   Wed, 16 Jun 2021 13:18:13 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: RFC: Github PR bot questions
Message-ID: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
pull requests on a project and convert them into fully well-formed patch
series. This would be a one-way operation, effectively turning Github into a
fancy "git-send-email" replacement. That said, it would have the following
benefits for both submitters and maintainers:

- submitters would no longer need to navigate their way around
  git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
  have a patch-friendly outgoing mail gateway to properly contribute patches
- subsystem maintainers can configure whatever CI pre-checks they want before
  the series is sent to them for review (and we can work on a library of
  Github actions, so nobody needs to reimplement checkpatch.pl multiple times)
- the bot should (eventually) be clever enough to automatically track v1..vX
  on pull request updates, assuming the API makes it straightforward

A this point, I need your input to make sure I'm not going down any wrong
paths:

- My general assumption is that putting this bot on github.com/torvalds/linux
  would not be useful, as this will probably result in more noise than signal.
  I expect that subsystem maintainers would prefer to configure their own
  GitHub projects so they can have full control on what kind of CI prechecks
  must succeed before the series is sent out. Is that a valid assumption, or
  should I be working towards having a single point of submission on each
  forge platform (Github, Gitlab, etc)?

- We can *probably* track when patch series get applied and auto-close pull
  requests that are accepted -- but it's not going to be perfect (we'd
  basically be using git-patch-id to match commits to pull requests). Or is it
  better to auto-close the pull request right after it's sent to the list with
  a message like "thank you, please monitor your email for the rest of the
  process"? The latter is much easier for me, of course. :)

I'll probably have more questions as I go along, but I wanted to start with
these two.

Thanks,
-K
