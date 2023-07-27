Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E376CC0015E
	for <workflows@archiver.kernel.org>; Thu, 27 Jul 2023 00:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjG0AYS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 20:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjG0AYR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 20:24:17 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77966100
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 17:24:16 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-76595a7b111so32191985a.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690417455; x=1691022255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51TmouK3bQfcqf7zaNKCd8MK7cCyJry2iObUP3bhEHw=;
        b=DccICbdEIa2wnCVWIBRU2/Mo1iCa2JZQ/5JsPGF49XmuicqrP3cORW9krtbhIX415l
         9J4H7IRv9bUbJfHrQLzKr95BHNlhjutJxADDiBjy45Fvh0gvMB8TWbLMhszjsOVt8Uaa
         66wR0tLanO2w0wSxy0h2cYeZYBp+8ca9idrx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690417455; x=1691022255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51TmouK3bQfcqf7zaNKCd8MK7cCyJry2iObUP3bhEHw=;
        b=WBWKye4Uy7lcGCHXLt3QkHwvqDFj42Ievz48/q1Nrokhq0xYJwz6iSb4TAihEKDWjd
         koH17zoQSK3PqaaTdtuAG82Bq3u1xK0Jq20sUsIzKuNAozZbFILJ+VnNAKuIa3tmy6cn
         /NzdGGa9ICsG/4nCB88mE33rgDIEonqOkviNtdPTRqOgMHtta/N+o64pGDqzY1XJrBvF
         Tyc/w7KSmved9MO1mrqPsKfUQuW8eoCMSysiw7bKGos0xH8n7h7YR5eQOAnN27ZpIGBc
         2y0iFJrm7Yj4uFj2dVcdgSHVHNxo5j/gONeUAAfBK4YUO/8Fn8i8nd4sAmpjD7zM1QVA
         fGjQ==
X-Gm-Message-State: ABy/qLa9PVhI3gIQFXjneKUmfyzt201BFao7Qmnek90zL8fwT6a1XpSt
        gFxQoKAv1IpK1+d1kskhXJpH7w==
X-Google-Smtp-Source: APBJJlFPrVeNK+Esuyd1CMyM2UVHXHOda0pZ6g4OHeYqaPavDA42Fy8/kwdMdFZW76JN+dfkYqf/bQ==
X-Received: by 2002:a05:620a:44c3:b0:75b:23a1:832f with SMTP id y3-20020a05620a44c300b0075b23a1832fmr5009797qkp.42.1690417455662;
        Wed, 26 Jul 2023 17:24:15 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id o12-20020a05620a15cc00b0076af430d902sm29638qkm.63.2023.07.26.17.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 17:24:15 -0700 (PDT)
Date:   Wed, 26 Jul 2023 20:24:06 -0400
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
Message-ID: <20230726-armless-ungodly-a3242f@meerkat>
References: <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
 <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
 <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org>
 <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org>
 <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
 <20230726-june-mocha-ad6809@meerkat>
 <20230726171123.0d573f7c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726171123.0d573f7c@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jul 26, 2023 at 05:11:23PM -0700, Jakub Kicinski wrote:
> Hm, hm. I wasn't thrilled by the idea of sending people a notification
> that "you weren't CCed on this patch, here's a link". But depending on
> your definition of "hitting the feed" it sounds like we may be able to
> insert the CC into the actual email before it hits lore? That'd be
> very cool! At least for the lists already migrated from vger to korg?

No, inserting their addresses into message headers would invalidate DKIM,
which is not what we want to do. However, the idea is that they would receive
the actual patches in the same way they would receive them if they were
subscribed to a mailing list.

Think as if instead of being Cc'd on patches, they got Bcc'd on them.

-K
