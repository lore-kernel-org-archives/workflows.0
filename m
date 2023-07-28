Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C51EB64DD
	for <workflows@archiver.kernel.org>; Fri, 28 Jul 2023 20:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjG1U30 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Jul 2023 16:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjG1U3Y (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Jul 2023 16:29:24 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B599423B
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 13:29:23 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-76af2cb7404so199172185a.0
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690576162; x=1691180962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eMyiYSraWOsfgY7mYokHSSuNHn+kD9GoiXATa0bMhbA=;
        b=CyBzgfMVag2WTWwhwboVgeQuGJ8BrCm87IB6j9uR6o6bep1JkWYRgrEgDybWowy+kJ
         YqNGl2ezH5o2/HFJPLiJ7Owzdi28zy+HpYhNpsVVxYi5pj9pTA0Yuv9d1vkm3rwLWYPm
         tvqU7DbjNhxOp4sXeS2yP2ybAXRqtiW0dZiN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690576162; x=1691180962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMyiYSraWOsfgY7mYokHSSuNHn+kD9GoiXATa0bMhbA=;
        b=ivu95iAoBIPQ0OQC/aKf1TYj32TOy+FBh0shF0KlSP2JsKoZN4TFGX+JH8jezdA+8B
         Wi94K4WVMoL/DfldmUmAuocZTIyCBlT0Ry7DBWMC90f1GDsgvcyyTzfOXTR8JzbyQKkP
         Zsdhk/UHUWVsdPsNrUAXL/Vb2RExPsyYj/7eBgtJ7PPag63mLDTRNuS2suUwAwMbMliP
         RDvjTD9n/pjOe+N+nH0jFfrMiy0QyD8nlvW18BC6OwpUv4VXkcBffKcoXLMzaqqCWYAg
         g319gHfCVlDOZh/GBerIRMC0XQEPZVdkBpgPNMVuDcDt/hx/2hQ7UqLGXp7vICSs/QOR
         cXXg==
X-Gm-Message-State: ABy/qLZqFWRpY4BJTzkUg3AHTrULNvZCMCcQMut0/8Ck0sY4Zblix9tA
        8siywzzZ3SQ7sp8d80DmNWILlA==
X-Google-Smtp-Source: APBJJlEH8lk5dwyzE/DgADvnA4XqnbUm4KS8L0cE5+GCBLvF3aA9Fy8KrmFx861A+YXH+5lm8F2GOw==
X-Received: by 2002:a05:620a:2ac5:b0:767:117c:f57b with SMTP id bn5-20020a05620a2ac500b00767117cf57bmr4052291qkb.8.1690576162510;
        Fri, 28 Jul 2023 13:29:22 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id f7-20020a05620a15a700b007682634ac20sm1372246qkk.115.2023.07.28.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 13:29:22 -0700 (PDT)
Date:   Fri, 28 Jul 2023 16:29:13 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
Message-ID: <20230728-egotism-icing-3d0bd0@meerkat>
References: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org>
 <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org>
 <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
 <20230726-june-mocha-ad6809@meerkat>
 <20230726171123.0d573f7c@kernel.org>
 <20230726-armless-ungodly-a3242f@meerkat>
 <1b96e465-0922-4c02-b770-4b1f27bebeb8@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b96e465-0922-4c02-b770-4b1f27bebeb8@lunn.ch>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jul 27, 2023 at 01:00:15PM +0200, Andrew Lunn wrote:
> > Think as if instead of being Cc'd on patches, they got Bcc'd on them.
> 
> And how does reply work? I assume it would only go to those in To: or
> Cc: ? Is there enough context in the headers in a reply for the system
> to figure out who to Bcc: the reply to?

I have actually solved a similar problem already as part of a different
project (bugbot). We associate a set of additional addresses with a thread and
can send any thread updates to those addresses.

It would require a bit more effort to adapt it so we properly handle bounces,
but effectively this does what you're asking about -- replies sent to a thread
will be sent out to all addresses we've associated with that thread (via
get_maintainer.pl). In a sense, this will create a miniature pseudo-mailing
list per each thread with its own set of subscribers.

I just need to make sure this doesn't fall over once we are hitting
LKML-levels of activity.

-K
