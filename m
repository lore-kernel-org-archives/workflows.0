Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6593CC001E0
	for <workflows@archiver.kernel.org>; Mon, 23 Oct 2023 14:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjJWOCz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 23 Oct 2023 10:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbjJWOCy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 23 Oct 2023 10:02:54 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA22710C2
        for <workflows@vger.kernel.org>; Mon, 23 Oct 2023 07:02:48 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5a31f85e361so1816454a12.0
        for <workflows@vger.kernel.org>; Mon, 23 Oct 2023 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698069768; x=1698674568; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhW2ovogLAtdgY5SQJlkyUio4XiA8u6f7LVxFg6+xTw=;
        b=28jjL3dGmwdSUNGHPq9r6/PNDV2Zq8+g86rWh5kEdvzsDIjYDps+VbW8/Tp5T49rMy
         1vnL8QahM4PD4Og8ZeOHLxN73p3StEGHBQ0Ecwr+U7Bx9LtQNJTwdQmwD/i7VdXKTaP2
         5CSu1nOUYprg6GS1eyhXmdNlREK28ToDzDiOlqQ8yBWKPsVFzp+2mruCTVMrtXMYD6rv
         KEu0oGRC74EblJPRSHobwUgqdUjrJiwQc/dro6kUOygetsA4n5R7cqh1B+YsD1q8LAnE
         sl25Ggz0P1oNujddlAQZlCXW4QxZC4tU9Jd1w2p8z+QfLuRbtyeid9is/hICq/mdY54O
         VZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698069768; x=1698674568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhW2ovogLAtdgY5SQJlkyUio4XiA8u6f7LVxFg6+xTw=;
        b=r/fPyTVfSdqhnB7kQt0Q3CpifwUDuHG3pEp/2IKlMRI9gK1FI/p8XSlzJsE+XPFbo0
         dcPGPiSjBclwAxzYpoHPDuISC60Zwtx9MzjjXogA6bQstlTksEQ14o6mkkqr3Etrpdbt
         gRpB7Ma0uDQHcaQtkR/zJ1NuIRRWpu5pHtbUwwXG3l0kn0CLaX4dfZktdyfUm7qxcfNy
         34+5E4ewTd2COBjGjuMiu+6aCtiDH4qDkOY7Q8w7U/bivNwDX0lGnHYvyC0tupqhnfsR
         NWjjEcEE2qPTG8b6yT2e41dBlNWA2C1yNDCCt2z5CtaSkY2xav5r8S91pppk436mV3aI
         4F2w==
X-Gm-Message-State: AOJu0YxngpalPyACc+Fq99oftyOHDTluXdgdCGfuq1gP5foJiHtmUt0J
        D8IMYylW89xOUn749dkzpJXFMy4JUX8=
X-Google-Smtp-Source: AGHT+IGUuvbhHZfz3wZFORlHNhRdI0cdjVmY0n57bSPikZhKGOb7nYXCvw6ZXfanc1szj32IaalJvX01dDI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ab5a:b0:1c7:3462:ce8d with SMTP id
 ij26-20020a170902ab5a00b001c73462ce8dmr169614plb.10.1698069768169; Mon, 23
 Oct 2023 07:02:48 -0700 (PDT)
Date:   Mon, 23 Oct 2023 07:02:46 -0700
In-Reply-To: <20231023102846.14830-1-przemyslaw.kitszel@intel.com>
Mime-Version: 1.0
References: <20231023102846.14830-1-przemyslaw.kitszel@intel.com>
Message-ID: <ZTZ9Bk3-NrK_cVDu@google.com>
Subject: Re: [PATCH] checkpatch: allow tags between co-developed-by and their sign-off
From:   Sean Christopherson <seanjc@google.com>
To:     Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jacob Keller <jacob.e.keller@intel.com>,
        Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

+Mateusz

On Mon, Oct 23, 2023, Przemek Kitszel wrote:
> Additional tags between Co-developed-by and corresponding Signed-off-by
> could include Reviewed-by tags collected by Submitter, which is also
> a Co-developer, but should sign-off at the very end of tags provided by
> the Submitter.

...

> Mateusz Polchlopek <mateusz.polchlopek@intel.com> has reported this to me.

Heh, there's a tag for that...

  Reported-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>

And it's usually a good idea to Cc the reporter in case there are questions they
can help answer.

> @@ -509,16 +509,18 @@ Example of a patch submitted by the From: author::
>  	Signed-off-by: Second Co-Author <second@coauthor.example.org>
>  	Signed-off-by: From Author <from@author.example.org>
>  
> -Example of a patch submitted by a Co-developed-by: author::
> +Example of a patch submitted by a Co-developed-by: author, who also collected
> +a Reviewed-by: tag posted for earlier version::
>  
>  	From: From Author <from@author.example.org>
>  
>  	<changelog>
>  
>  	Co-developed-by: Random Co-Author <random@coauthor.example.org>
>  	Signed-off-by: Random Co-Author <random@coauthor.example.org>
>  	Signed-off-by: From Author <from@author.example.org>
>  	Co-developed-by: Submitting Co-Author <sub@coauthor.example.org>
> +	Reviewed-by: Some Reviewer <srev@another.example.org>
>  	Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>

This is silly.  Allowing tags in-between Co-developed-by with Signed-off-by
unnecessarily complicates things, e.g. people already miss/forget the rule about
tightly coupling Co-developed-by with Signed-off-by.

And if we're being super pedantic about chronological history, arguably the
Reviewed-by should come before the Co-developed-by as adding the Reviewed-by is
a (trivial) modification to the patch that was done by the submitter.
