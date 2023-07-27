Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80EFC001DE
	for <workflows@archiver.kernel.org>; Thu, 27 Jul 2023 00:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjG0Add (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 20:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbjG0Add (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 20:33:33 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E0F2135
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 17:33:26 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-63d0228d32bso2735586d6.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690418006; x=1691022806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbFtBP3s5EoZN2IL1k6gw8UtCCG0lN7bHzqRjLPLmmw=;
        b=ZUcAn/OQFw6SUFcrZQR46N2yGO1FB+emshuk+KqIsV4o4Q5GS+/0sg84LgrrmsRirv
         AU6xdjLA+uXvV/bB7qmSyLg9pyRvCIj9BPPVvyW1jbBkYCWEppBPZBBsFGmZ9tg2j7nn
         e1FkTW+P6EYtyy06W8NCcJ4tLXC/LoYXU7DFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690418006; x=1691022806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbFtBP3s5EoZN2IL1k6gw8UtCCG0lN7bHzqRjLPLmmw=;
        b=PgObvKVwHfMGsnOVCFP58pdw1zlGfzfbey7iBXiM3hvaEIr8EEefhrC7nXNibQQtmJ
         195Pt8rrbaInYez+LpioXxvljZ4XhO6/lAgqnFmJW5TP/ZUN3dFwO4wiRs8Vupz7rhxI
         pFRrVG1a8Hm10Lsa1JTl/UfAyNgf868GvbJPE5MP/b4Oozq7AkPOq6/E08zvQ+IxGTnm
         xS8vYb5QD2RnLS8qF6C8OX4s4kRVP8zimEr9gkuqLCU6Xd9LBqHeXE5TrdRn7hZtqoae
         o54wsRKQjM7W8Nu8w/liwRzR8CwHkWBtlM1lW9gWmsno22XOgZnVUaY4PA8ONICrtMKF
         O2xg==
X-Gm-Message-State: ABy/qLaMVWufp1l45wdKeEqi16GnEGniMMBINx9Z8byP0J0VWsGqapbS
        Lc8cSj4KrxEA4BxgKWW5BbcBOw==
X-Google-Smtp-Source: APBJJlHRPzEVl93oZVeOEl8p0u79e9fcH4T7R5h+Gb8P21nnFewM9G5Q1FtXVJUQsQCQYRbnZghTsA==
X-Received: by 2002:a0c:b2c2:0:b0:63d:c37:bf86 with SMTP id d2-20020a0cb2c2000000b0063d0c37bf86mr3683119qvf.41.1690418005785;
        Wed, 26 Jul 2023 17:33:25 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id b20-20020a0cb3d4000000b00626286e41ccsm31892qvf.77.2023.07.26.17.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 17:33:25 -0700 (PDT)
Date:   Wed, 26 Jul 2023 20:33:16 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
Message-ID: <20230726-yeah-acrobat-ba1acf@meerkat>
References: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org>
 <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org>
 <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
 <20230726-june-mocha-ad6809@meerkat>
 <20230726171123.0d573f7c@kernel.org>
 <20230726-armless-ungodly-a3242f@meerkat>
 <20230726172758.3f6462f3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726172758.3f6462f3@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jul 26, 2023 at 05:27:58PM -0700, Jakub Kicinski wrote:
> > Think as if instead of being Cc'd on patches, they got Bcc'd on them.
> 
> I was being crafty 'cause if the CC is present in the lore archive
> our patchwork check would see it :] 
> But cant just trust the automation and kill the check, then.

If we can get it working reliably and to everyone's satisfaction, then I think
the need for this check goes away. The submitter can then just worry about
getting *everything else* right about the patch and not worry about who to add
into Cc's.

-K
