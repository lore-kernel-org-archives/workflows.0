Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE9BCA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 17:35:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7A3520862
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 17:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iSYNtzBj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfKARft (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 13:35:49 -0400
Received: from mail-qk1-f175.google.com ([209.85.222.175]:45313 "EHLO
        mail-qk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfKARft (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Nov 2019 13:35:49 -0400
Received: by mail-qk1-f175.google.com with SMTP id q70so11366670qke.12
        for <workflows@vger.kernel.org>; Fri, 01 Nov 2019 10:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6G4twgNgUz+roO3LSZ9tq2dl4nN58nc6GLFzDs4QPp4=;
        b=iSYNtzBjUmozgGf93Du2gJ9nhUYm5QqCzGB9mX6/4/mf0XbZqn3W0Rc6K/x76hvxx5
         ISOma9wVo+y/uiKZpR6K1X2tN6PKKEx6BoUb48rKEQ5/S5z052eFpn1W9XLErrlV3ZZj
         58pwDi3JBns+Lpi7RPl8/j5tF/e5qO2LNiK2WQdMzz1HSVE3XST+TpVvrWlFBDjHqM0t
         X+XjqfL64IWFKt5HUpeS8Go3Ls+kQ0FI4QCxtHt+VY/RAsnomjfkTFwHGcFHO00zhlRi
         vVaFYVALZKaijiz14hGHzagIIsRIYKeU34hRYwJUu5lYeZHmJvCBuyZF5uSXs2Qemrer
         ESzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6G4twgNgUz+roO3LSZ9tq2dl4nN58nc6GLFzDs4QPp4=;
        b=NWMa4eQjUDI0SXvnojaoQMqrftkR/YAKkuxhuWDiLuMl1PBxYEgnALQyVz6r4bVI2d
         ox3fa85Vo4tPQzeqgxYI1SNnC3jNLa52yCFmeFCBS9hIFI6kxvDE193ZCwY5yDeW6aMk
         SK7oBh1IuwlI9HXeC95PZuCFe9ini8+U1O8dAd/3BVXOTQKYDpIVMumWAPponiMJ8HJI
         40Aq0KESHumDd6IcaZS3RpoCp0A00dX4k6QIcu/PKM7BTd1vl72oW4CFCsPXo77uhFk1
         vblv7Wqn34u0DHeZW7OHzBaMKrVx5Gr7UwYCVkAvns4XTzFukGexoJWITu9hB44C/QeH
         e/JA==
X-Gm-Message-State: APjAAAVzsf85yOa+WU1QdGN0IfaqkhnH5BidBEwno955rve9tIKy/vhe
        6F3U7+8rE+eMLsJdib1vb6KsCgEu54eY8dEzUA/WJw==
X-Google-Smtp-Source: APXvYqyYJE8FqByLepgmWghYAYikC82Z/RtvpU39clegXG7seB3FQNDrk+W/S33X68u9vmFqzD4dtaWFOkxsz9D/Alk=
X-Received: by 2002:a05:620a:126d:: with SMTP id b13mr5842520qkl.250.1572629747601;
 Fri, 01 Nov 2019 10:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAFQ2z_PiNzDeBT7mnprRdk2kf==HoBU1HM7NT4hgFns1wt4WVg@mail.gmail.com>
 <87wocnmb8j.fsf@dja-thinkpad.axtens.net> <20191101172910.x7neoilwaotj5njb@pure.paranoia.local>
In-Reply-To: <20191101172910.x7neoilwaotj5njb@pure.paranoia.local>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 1 Nov 2019 18:35:36 +0100
Message-ID: <CACT4Y+bu=tZNWRMOHXEDb8=TKwcrJgJqeU9_U9YyAUyF1kLWiQ@mail.gmail.com>
Subject: Re: Lyon meeting notes
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Daniel Axtens <dja@axtens.net>,
        Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 1, 2019 at 6:29 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Oct 30, 2019 at 09:35:08AM +1100, Daniel Axtens wrote:
> > > KR: write local command to work with patchwork.
> > We have a couple of local commands already, pwclient and git-pw. Is
> > there something new that would be helpful?
> >
> > As an aside, I know offline stuff has come up a few times, and I think
> > it should be reasonably straightforward to make a caching API client
> > that can buffer your requests until you're next online. I don't have any
> > cycles to do this, but I'm happy to help anyone who does.
>
> This is part of the tooling work that we discussed and I plan to have a
> more elaborate proposal finalized next week. We are hoping to fund the
> development of two closely related tools, one CLI and another using the
> browser interface, using a web server available over a localhost (or a
> local network) connection.

Hi Konstantin,

I am not sure if you are implying it here or not, but I would assume
it would be useful to run an actual "web" copy of this server over a
federated feed as well. Because... why not? it should be easy to do
and provide unified experience for online/local modes.

Otherwise looks good.

> The overall set of features for the web-interface would be:
>
> 1. Run the web interface locally in a container, to be accessed over
>    localhost
> 2. Use public-inbox feeds as the source of incoming patches, allowing to
>    pre-filter by:
>    - list-id
>    - from/to/cc
>    - keywords
>    - patch file path
> 3. Integrate natively with the local repository to allow the following
>    functionality:
>    - apply series directly to the repo, from the proper base-commit parent
>    - recognize patches that have already been applied and auto-archive
>      them as necessary (current kernel.org's patchwork-bot functionality)
> 4. Offer code-review features using the web interface (something
>    similar to gerrit), with outgoing email sent back out to the
>    submitter (plus list, cc's, etc), using the reviewer's own From: and
>    smtp server information
>
> For the lack of a better term, I'm calling it "local patchwork", though
> it's more likely to be a closely related spin-off that would hopefully
> share a lot of code with patchwork and be able to both benefit from
> upstream and to commit code back up for any shared functionality.
>
> Caveat: this is not finalized and I will be putting up the proper
> proposal up for a discussion here. Since we're talking about both a CLI
> and a web interface to largely the same functionality, it's possible
> that instead of attempting to run patchwork in a container, it would
> make a lot more sense to run a daemon exposing a REST API that both the
> CLI tool and the web tool would consume. However, this would require
> rewriting a whole lot of things from scratch and would end up a lot more
> difficult to both fund and develop -- which is why I'm leaning towards
> adding these features to Patchwork instead.
>
> -K
