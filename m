Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7BEC433EF
	for <workflows@archiver.kernel.org>; Mon,  2 May 2022 15:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382334AbiEBPgw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 2 May 2022 11:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351821AbiEBPgv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 2 May 2022 11:36:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5319B841;
        Mon,  2 May 2022 08:33:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8191B611D5;
        Mon,  2 May 2022 15:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3916C385AE;
        Mon,  2 May 2022 15:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651505601;
        bh=0vpFtAR+jVt9CmV0zaatcfQF9T2fP+G4qxjRqbb5Tuo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gP2fzgECpCxIAR6HmshSb+aD0kSGvvnmOEZSsKwThVdF1GLGV1c4ML0BKrfhhiHyb
         wEWP/BEXz58xJ5feWShHWVdvd0632N7NfZuFJNhT6DRXIs7Nj+TxBopiQm0hqXu+wz
         QpH8W6y8/YIGu7GgxAmN8NyKF7+ZRam1RNEhRlVhUNL0s5aVG+C4JEaUxgVm2eaR2m
         E4ilokTHsJ6ZNLSc5gvwmFC2zjsny7pZce7MGP31x6Ocm0ccz5nIrhqxFLqdIas2T9
         YCy2DoOkmNBhSflxcjAm3K3zPMCpgMY87IuJsUWb2YlHaR+p95TzmOI8JODN5xelx6
         bV+GHM8SxJWpA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso151779347b3.5;
        Mon, 02 May 2022 08:33:21 -0700 (PDT)
X-Gm-Message-State: AOAM530ZVgZ/tXbxy/niYGk02bE6FLK3PVq2EVokNqEa35zAY+Donvku
        t0HBJaiIpLw9028VGJNh29kDdDMFlmhZTMZDEKc=
X-Google-Smtp-Source: ABdhPJxW8HXU2bZar9R4M7V9XEDtgfphYFnCT1eh3fNpS4t53WprzET66XiEPTOV57rLcGh6NpKV4nMQrA2VsU4uV4Q=
X-Received: by 2002:a81:1697:0:b0:2fa:32f9:78c8 with SMTP id
 145-20020a811697000000b002fa32f978c8mr1073507yww.135.1651505600863; Mon, 02
 May 2022 08:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220502071818.5101c752@kernel.org> <87ee1cxb2o.fsf@meer.lwn.net> <Ym/2U0elJvJM3hmN@pendragon.ideasonboard.com>
In-Reply-To: <Ym/2U0elJvJM3hmN@pendragon.ideasonboard.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 2 May 2022 17:33:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0AH5eou3vJxc+hH36giqjaivUeZL2heBVDSO8E+mCyMw@mail.gmail.com>
Message-ID: <CAK8P3a0AH5eou3vJxc+hH36giqjaivUeZL2heBVDSO8E+mCyMw@mail.gmail.com>
Subject: Re: Driver graveyard
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        workflows@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Thomas Osterried <thomas@osterried.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, May 2, 2022 at 5:18 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On a side note, navigating removals is something git doesn't make easy:
> git blame will tell when a line has been added (or modified), but
> figuring out when a line has been removed is more difficult. Or is it
> one of git's features that I simply don't know about ?

I find 'git log -p' to almost always be more useful than 'git blame'
when trying to
find out what happened to a file.

What I tend to do is to start with 'git grep $KEYWORD v3.0' (or
2.6.12, 4.0, 5.0 etc)
to see what file mentioned something, and then 'git log -p --
$FILENAME' to see the
commits leading up to the removal.

One bit I find missing though is for 'git log --follow' to track
renames from $FILENAME
to a new location, rather than following where it came from.

       Arnd
