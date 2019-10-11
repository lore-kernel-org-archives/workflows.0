Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FD7C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 22:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E87022084C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 22:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBqzlcNM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfJKWyg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 18:54:36 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:39820 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbfJKWyg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 18:54:36 -0400
Received: by mail-lj1-f178.google.com with SMTP id y3so11310901ljj.6
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Lqq2ROD3kKa1gg36bLWPRJPFH2NoReRxCgnboAGOLA=;
        b=VBqzlcNMxAlekeZLZq4vhRITKaRV/aSAY68fqhJ2lVXbenRSGF6VyWv4OEUpARr2oR
         c1yDbbvrq+qkTETJWGwv6Nh3GJiWxGXhVzaCp2BNuOrLZRs/x5gtLME7eiviiFqNuezI
         DF/WtrHkLN1XePtMm1K0BlkfPrubNVLJuznPNIWZfLNVl1Xoo0R8MBaU9aGFBOc87bte
         ufsxcni5N64CVD0MM8wJ3ZqaL2QbdkIEDy6YYN7MZk9iozg42mumdDMFL/P5IUbcDmZh
         Og2q7G6CBreoACWCfxXS7G8db5hQFkO+a89iUj7W1DLmhM6uAYVuJE1S0zMp1MnOIQhl
         Nzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Lqq2ROD3kKa1gg36bLWPRJPFH2NoReRxCgnboAGOLA=;
        b=KI8k4p/FSd/mBebOkrJXXkVeS1RgkCC/tkYqUITtdIYtHZitt3YgQ4UFawK1X6w7m7
         iOfD7Br2RFWZc+AyGaES+deGkq2M4yYOPRtevtnsIOUfmsTC0/ZtAJ/1GTwXHZgB3Oav
         CoCjMJDH3QoWxLOTB3O7+AtlI6ZYCLzJmI7FjR+lFF/eAg8lMWfwGz5JvRnwUeLfSMUI
         rJyGvn6BdXtqZW5RN2Qtd64kTz2yC+dubrRGNhFpXcTP4UArZOiKOYSgxRST3EX7Sj7d
         eYcQM9fuYRe1q4IMiSf+AHKHX7VF+x5gLn5EhXjgHFGDFKeTyyXSfcT5pgHqep5rOv4/
         EnOw==
X-Gm-Message-State: APjAAAUMf9WPkr/KW4FMu3d9KqDXgf++wBe1p7PuTBjekBy+2QI486Dm
        0SEiys+r+O6lvDtugu77L5FWnNa1DVTBWBWpo8pe6w==
X-Google-Smtp-Source: APXvYqwVjI6c74bmO4g6kwDfDL2P09I8rvo8gL6KEpSicrX9REWQuQfdYK4WuH52vvHibyLMw81RSTzH4+GNCpcIfFo=
X-Received: by 2002:a2e:42d6:: with SMTP id h83mr10280361ljf.21.1570834474041;
 Fri, 11 Oct 2019 15:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191011140108.589bbb52@gandalf.local.home> <20191011.113254.1964556815296845399.davem@davemloft.net>
 <20191011155949.145f0f7d@coco.lan> <20191011.121153.1410013220730418292.davem@davemloft.net>
 <20191011141909.1ccb58b3@hermes.lan> <20191011174719.16e997f5@gandalf.local.home>
In-Reply-To: <20191011174719.16e997f5@gandalf.local.home>
From:   Dave Airlie <airlied@gmail.com>
Date:   Sat, 12 Oct 2019 08:54:22 +1000
Message-ID: <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Hemminger <stephen@networkplumber.org>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 12 Oct 2019 at 08:34, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 11 Oct 2019 14:19:09 -0700
> Stephen Hemminger <stephen@networkplumber.org> wrote:
>
> > As someone who has to deal with a corporate busted mail server.
> > I agree mailing patches is a barrier to entry for many people today.
>
> Hmm, and I wonder what company fosters so many issues with doing that
> today? :-/
>
> /me notices that Stephen uses his personal email account ;-)

Your current employer also defaults to a crappy link replacer on most emails :-)

Dave.
