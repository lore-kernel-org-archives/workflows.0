Return-Path: <SRS0=22HX=YG=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB10C4360C
	for <workflows@archiver.kernel.org>; Sun, 13 Oct 2019 23:38:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAF62206A3
	for <workflows@archiver.kernel.org>; Sun, 13 Oct 2019 23:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="UBm4rGcw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfJMXi5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 13 Oct 2019 19:38:57 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:33611 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbfJMXi5 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 13 Oct 2019 19:38:57 -0400
Received: by mail-pg1-f177.google.com with SMTP id i76so9006826pgc.0
        for <workflows@vger.kernel.org>; Sun, 13 Oct 2019 16:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=IZA2Qqtk2v9MXWOQeSu3zHilGMEC2CaeQ+YVjCXSLro=;
        b=UBm4rGcwbQfyRyhRQLj+lmnadrIRzXJA1S9Q9CFTK1r0f4Ultqf3qsKHvVA5VAFjgz
         /ffd9eSD2Wn0KGBWod2NDa2BXHDVZpoVa/CwEOnDmpQwBkjr6kfU7gkfvmFHvA+aET8y
         nFblP+8ifre3pE6rmrNVIit0uLnKLG45g+5Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=IZA2Qqtk2v9MXWOQeSu3zHilGMEC2CaeQ+YVjCXSLro=;
        b=jx1kU801IBBy4FzksaKkIIvHi+hTTZtDwCCPZJmh9TlmyyjsLKiqSgSqfW308VUsS6
         S8X56V5nAAr+FCL/lilGzho1I/nI/yu6yhGkjimvhv9GV0k9fCrket4WS602dVl0KAnG
         wcNHV/htyphNREejP2+uXaqMy8iLIVPizFbgYogIpY/pBpbXGNuJ7n4tIXl3RkK38EQq
         2I+Z1G/i49qFRVbfigXc0DFfhZhS90TEkHaqcJqE1EkrZFS+JyjastCDQEWvCVBD5+Qu
         VzfnbiFbxyU58Q9EDh2BLx9S51r6M0/ED03aPwhQjny1b5BF2Aa6ShuxG54Xt8kS0+JD
         Cj1Q==
X-Gm-Message-State: APjAAAUotKfKMMhYBLAY3JZTO4Yzr3x1/lytoA0rtmXg6BYTXJxemie8
        tx3N+bOyyw2MYUdWAfZziQOnWA==
X-Google-Smtp-Source: APXvYqxNGLRuHjvhVDO9fdv9HmzWNRCIE+XPswjC1nKm8lsws4UTs0BSKUAare9CVAlZM+TjxIhclw==
X-Received: by 2002:a63:9557:: with SMTP id t23mr11634220pgn.268.1571009936143;
        Sun, 13 Oct 2019 16:38:56 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id q30sm14777681pja.18.2019.10.13.16.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 16:38:55 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
In-Reply-To: <20191011170839.75c52ad3@hermes.lan>
References: <20191011140108.589bbb52@gandalf.local.home> <20191011.113254.1964556815296845399.davem@davemloft.net> <20191011155949.145f0f7d@coco.lan> <20191011.121153.1410013220730418292.davem@davemloft.net> <20191011141909.1ccb58b3@hermes.lan> <20191011174719.16e997f5@gandalf.local.home> <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com> <20191011190009.6ee15756@gandalf.local.home> <20191011170839.75c52ad3@hermes.lan>
Date:   Mon, 14 Oct 2019 10:38:51 +1100
Message-ID: <87lftotdv8.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> It does bring up that any new workflow has to have security protocol
> and threat model as part of its design.

This is actually something that worries me about the patchwork
workflow. Maintainers seem to trust the patchwork version of a patch
without much (or any) verification that it matches what was sent to the
list.

Say Alice emails a patch that says something like:

 if ((permissions == allowed) && other_stuff) {
    do_things();
 }
 do_more_stuff(permissions);

List members read that email, and many review it in the email client.

However, say that the version in Patchwork actually reads like this:

 if ((permission = allowed) && other_stuff) {
    do_things();
 }
 do_more_stuff(permissions);

(You could get this with a malicious/compromised patchwork admin, or a
sufficiently advanced network adversary - patchwork takes the first mail
for a given message-id + project and later ones are discarded, so
there's a race you can win.)

If the maintainer or someone else happens to apply the patch from
patchwork and then review it, or if tests happen to catch the relevant
case, we'll catch this. Otherwise...

It's not the easiest or lowest risk way to get malicious code into the
kernel, but nonetheless, I worry about it.

I can't think of a sensible way to fix this, unless we want to move to a
world where patch submissions are GPG signed, and teach patchwork to
verify sigs.

Regards,
Daniel
