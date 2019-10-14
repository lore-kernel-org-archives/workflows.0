Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A325C4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 12:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CADE21848
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 12:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="EFNjAqy9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbfJNM1c (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 08:27:32 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36042 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbfJNM1c (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 08:27:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id y22so10335178pfr.3
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version:content-transfer-encoding;
        bh=+aeBjoIUgWHh/pWt4ckwfi/E6B5Es4XX0m4lyiOK4Z0=;
        b=EFNjAqy9R7lIJG+U8L32gkmNkjBNnKaC7mLVcQR5+FNByLvRLvFXdTjx/BfmkGogpK
         WoDVRUK2a0uwJRbxQ/UPf4m8oZUhBdqiQ00XOKIPv0rVKf75AmiibKQ+HhplmqM5hnJE
         /kfQpdKl7rl2E+EcXeFy17l+/g0vukdQGwNOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=+aeBjoIUgWHh/pWt4ckwfi/E6B5Es4XX0m4lyiOK4Z0=;
        b=kQoDE42F9YOoF38X1uAGUjpAi8UkKD1FJsf2k4IFBte+Pbxyu7EsUElOllmG4dZlwy
         HNRoO07fxlron7duu3DwOKvaCweELLMye4Sg21fTkHg5Lf/fv7VfOQiahnHQXzNYs/xv
         xxmGaSB67C48TYNXR9IYWg91FyGNP8srEzDLxx+aCSeVjCriCEAZQClqWeQBiWFZGsMY
         qBByZPLb/gn2fVX3AaL+nbTtYJJUUE67YYSNYETUeJDJfH6wN3o5Nsm+EtbjvczXO9Dx
         qCD5I5w3qih4S85VvXx1OhCGqdNf9bpwZSi+46SQPN+OsXaiPNn2ipqJmCzpVpB10gFJ
         cvOw==
X-Gm-Message-State: APjAAAXbv+neQPoLjpegaN1+4y3tX+J5e1PfDkviOBQWq1SLli8pZLtE
        r1MaD3lEBbLmb5y1WfXZEs/oxQ==
X-Google-Smtp-Source: APXvYqzqVXEPnosYG9jpTHe81XoQXofVtSyq8nYvc1ij0qoGmhJG4FyqutVxEOJZvkthgAGDP0V95A==
X-Received: by 2002:a17:90a:8089:: with SMTP id c9mr35120515pjn.69.1571056050311;
        Mon, 14 Oct 2019 05:27:30 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id 26sm21225924pjg.21.2019.10.14.05.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:27:29 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
In-Reply-To: <874l0bk3qb.fsf@toke.dk>
References: <20191011140108.589bbb52@gandalf.local.home> <20191011.113254.1964556815296845399.davem@davemloft.net> <20191011155949.145f0f7d@coco.lan> <20191011.121153.1410013220730418292.davem@davemloft.net> <20191011141909.1ccb58b3@hermes.lan> <20191011174719.16e997f5@gandalf.local.home> <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com> <20191011190009.6ee15756@gandalf.local.home> <20191011170839.75c52ad3@hermes.lan> <87lftotdv8.fsf@dja-thinkpad.axtens.net> <874l0bk3qb.fsf@toke.dk>
Date:   Mon, 14 Oct 2019 23:27:25 +1100
Message-ID: <87imortsuq.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> writes:

> Daniel Axtens <dja@axtens.net> writes:
>
>>> It does bring up that any new workflow has to have security protocol
>>> and threat model as part of its design.
>>
>> This is actually something that worries me about the patchwork
>> workflow. Maintainers seem to trust the patchwork version of a patch
>> without much (or any) verification that it matches what was sent to the
>> list.
>>
>> Say Alice emails a patch that says something like:
>>
>>  if ((permissions =3D=3D allowed) && other_stuff) {
>>     do_things();
>>  }
>>  do_more_stuff(permissions);
>>
>> List members read that email, and many review it in the email client.
>>
>> However, say that the version in Patchwork actually reads like this:
>>
>>  if ((permission =3D allowed) && other_stuff) {
>>     do_things();
>>  }
>>  do_more_stuff(permissions);
>>
>> (You could get this with a malicious/compromised patchwork admin, or a
>> sufficiently advanced network adversary - patchwork takes the first mail
>> for a given message-id + project and later ones are discarded, so
>> there's a race you can win.)
>>
>> If the maintainer or someone else happens to apply the patch from
>> patchwork and then review it, or if tests happen to catch the relevant
>> case, we'll catch this. Otherwise...
>>
>> It's not the easiest or lowest risk way to get malicious code into the
>> kernel, but nonetheless, I worry about it.
>>
>> I can't think of a sensible way to fix this, unless we want to move to a
>> world where patch submissions are GPG signed, and teach patchwork to
>> verify sigs.
>
> It should be detectable, though, right?
>
> Say you have two independently administered patchwork instances (or even
> better, two different software packages entirely) that both subscribe to
> the mailing lists, and compare patch content with each other. They
> should at least be able to detect mismatches. Especially if you add a
> sanity check before discarding duplicate message-ids.
>
> This way you'd need to compromise multiple machines to achieve the kind
> of compromise you're worried about. And you can add more independent
> machines until you're satisfied that the risk is low enough :)

Yeah, it's detectable, even more simply if someone who subscribes to the
list checks patches they receive against a public patchwork. But my
concern isn't that it's undetectable, it's that it unlikely to be
detected in practice unless someone goes to the effort of writing code
to do it.

Regards,
Daniel

>
> -Toke
