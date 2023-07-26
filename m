Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656B5C001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 22:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjGZWCY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 18:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGZWCY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 18:02:24 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EC61BF2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 15:02:23 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52256241c66so464222a12.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 15:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690408941; x=1691013741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GY186T8m/bDCmaQhdLceOK7QlWH6sfqqrFjk853Mroc=;
        b=ZlEjpgTswNyeC2aD0u7KqX182+Wu6Nm28qo4hUgQFXpkqndCJIElxjRMV07rPz0N6T
         jsGpz5JKATZ169JHR2xHD9FTAnM0KHilfcnXF96kX9OvYQlUtU7NqZnedbDfb2YmxanL
         qsBl6n3as/e3vD792jT3SkgiM6SDbk+rHgkAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690408941; x=1691013741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GY186T8m/bDCmaQhdLceOK7QlWH6sfqqrFjk853Mroc=;
        b=MF6BTaX4Cyj04NYVV2PseQoOwIKDOxhFayrtsWmGeWWJOeXcmkiDa/QpjInv/huUog
         Er9c8Nn6xnwbQITFt1EmSKUx1NBTeP+goHoujgVzJejpd86bOQZMbqfoNaiM4kocgxM3
         0RpqO4lcHjKELdEflEDXXm8ctzDjcSQck5TRXAr5zxS9fXyPR0Za/4UlDduMG6b5kKil
         GMOkzWznIpVVCGMP4Kx5bOnQ61GNUzcWYchJFWLypKpE5TFuiGI30iuRkdFJcqjUQDO6
         0EbXaypQnquRWEjg54XGVmq8wv3lQG/AtS0Wt5RC17RwSSw/1skQxhYWGUVYmoZnztOn
         dmVw==
X-Gm-Message-State: ABy/qLZxBmJG0P4HPLB5IZ4Z4MPVnMhMTVShRV/rETBn0LrfQVGB7VqB
        Z5urCkqEIExS7cjsKvO0qAVjid5Dtk7UfbRKWHssMUBP
X-Google-Smtp-Source: APBJJlGudlBSgWAMjPxzVbhnTNitekBudjy7aT0v9nvX2iMLp5ElDkX3BEkVToSdeGnbID2TZUbguA==
X-Received: by 2002:a05:6402:14ce:b0:51f:f079:875f with SMTP id f14-20020a05640214ce00b0051ff079875fmr382342edx.4.1690408941451;
        Wed, 26 Jul 2023 15:02:21 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id m15-20020aa7d34f000000b00522584bb58esm1644721edr.24.2023.07.26.15.02.20
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 15:02:20 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so3174371a12.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 15:02:20 -0700 (PDT)
X-Received: by 2002:a05:6402:3552:b0:522:405f:a7 with SMTP id
 f18-20020a056402355200b00522405f00a7mr344715edd.16.1690408939880; Wed, 26 Jul
 2023 15:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org> <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
 <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
 <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org> <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org> <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
In-Reply-To: <20230726145721.52a20cb7@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 15:02:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJx-FDuH6+22D+L2gMdVOpYi948oWpJr7BpbS-0pEqFg@mail.gmail.com>
Message-ID: <CAHk-=wiJx-FDuH6+22D+L2gMdVOpYi948oWpJr7BpbS-0pEqFg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 at 14:57, Jakub Kicinski <kuba@kernel.org> wrote:
>
> > And it can't even be the right thing to do, when experienced
> > developers don't do it.
>
> I explained to you already that Florian's posting is a PR.

.. and your point is?

The fact is, experienced developers don't add cc'd when they commit
their own patches, and nobody bats an eye on it.

So you are *literally* saying that inexperienced people should do this
pointless thing that can be - and is - automated, even though it's
clearly not the thing that is required in general.

And you're saying that I should have to change my workflow to make it
MORE INCONVENIENT to do the thing that you claim inexperienced people
do now.

Yup. We're done here.

               Linus
