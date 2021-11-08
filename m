Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB72CC433EF
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 22:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1C3461179
	for <workflows@archiver.kernel.org>; Mon,  8 Nov 2021 22:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240756AbhKHWjq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 8 Nov 2021 17:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239019AbhKHWjp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 8 Nov 2021 17:39:45 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB222C061570
        for <workflows@vger.kernel.org>; Mon,  8 Nov 2021 14:37:00 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id s9so12905010qvk.12
        for <workflows@vger.kernel.org>; Mon, 08 Nov 2021 14:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XePuB4pJ45gRMFh9S/2FpFDlwmjQPKqTW190ak6GUV8=;
        b=HBJMSYaefOrsrbv11RmqYhw+aCG0C5Tlsl7/yjTsNs6y+gxvAD5lzt6fa3+fIo+Zvw
         R9DypfnM8PfYltkjtihSbWk8wCKswTQJt0/fsnObWUh0gglFA1hWhjYSauF9sPJs3mFz
         /pIl50aO41Kp5X+FyJZbVkhefOzYU7fhUOZjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XePuB4pJ45gRMFh9S/2FpFDlwmjQPKqTW190ak6GUV8=;
        b=XdvPwpQBOSNI6V00xU0VOI0qxQpZ0uTY9FyBgCFsIlX61y1QgmWg8okad7sqUOllE7
         3yUH4fTwubQAttUMTMYIVSeO3lBWWoVYUYzVSMQzZojiIzmlZxI4WPbL4MUshoLtyTwD
         H0l9zdC+fPZJTrZUFEYSoSjPHb30oWWiLcRQyy0jDVe0zE5i+VI3kqOOIHgbGWuHI0HY
         jbNLKvw3oeHr1cDlLpk4UsMvSw72iMJHLea8HGBCkS2Gs0ctw8KiW+rt5IjD/bmcA8Kk
         eHgN5twk9gY/ubCXGTorDAwQE8eZc8bG2krEed7uFmaDR85wv6S2oT28Ukgcv7yKCpJz
         FV8A==
X-Gm-Message-State: AOAM533EDuILv5VQQa2kWvDVCA+0tJL9Gz5qzCodRfZQTg6OKehx85HI
        4t5kw8yk6S5LBRt98eQ4gbgkhg==
X-Google-Smtp-Source: ABdhPJwrb40uqLcrjNwUnWFaatFcUkO+ViJRQbM1Wlr9X/y2nf/v86we9giEX4JleKtM6aVNB863cg==
X-Received: by 2002:a05:6214:2aa3:: with SMTP id js3mr22144251qvb.49.1636411019774;
        Mon, 08 Nov 2021 14:36:59 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id s127sm9423473qkh.61.2021.11.08.14.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 14:36:59 -0800 (PST)
Date:   Mon, 8 Nov 2021 17:36:57 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     Rob Herring <robh@kernel.org>, meta@public-inbox.org,
        workflows@vger.kernel.org
Subject: Re: lei: incorrect quoting on saved searches (was Re: lore+lei:
 getting started)
Message-ID: <20211108223657.jhsssoumfbmf4dhw@meerkat.local>
References: <lorelei.part1.202111051304.mdtebsxahljcrxak@meerkat.local>
 <CAL_JsqJBh1O3H2-P07AHzVq0x89BoP_N6P=rT5up6=3QyF_B0Q@mail.gmail.com>
 <20211108202204.q5zg6bachnvbjlnx@meerkat.local>
 <20211108204923.GA12823@dcvr>
 <20211108213613.4hjtbokwzar7x4ph@meerkat.local>
 <20211108214836.GA21665@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108214836.GA21665@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 08, 2021 at 09:48:36PM +0000, Eric Wong wrote:
> > Hmm... I noticed that when I `lei edit-search` the initial query that was
> > causing quoting issues, I get the following:
> > 
> > 	[lei]
> > 		q = (dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org
> > 
> > So, the extra quotes didn't get added to the config file. Running `lei up` on
> > that saved search seems to do the right thing, so the erroneous quotes are
> > only added during the initial `lei q` call.
> 
> Right, each entry in lei.q is actually an entry in argv[].
> So the correct query should look something like:

So, to be clear here... the following doesn't work because instead of multiple
query parameters to 'lei q' the single-quoted string becomes a single
parameter?

	lei q -I https://lore.kernel.org/all/ -o ~/work/temp/lei/robh-patches \
    --threads --dedupe=mid \
    '(dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org'

Any way to make this work? I find that it's more easily readable than the
"echo | lei q" version.

For bash users, the following should work as well:

	lei q -I https://lore.kernel.org/all/ -o ~/work/temp/lei/robh-patches \
    --threads --dedupe=mid <<< \
    '(dfn:drivers OR dfn:arch OR dfn:Documentation OR dfn:include OR dfn:scripts) AND f:robh@kernel.org'

Suggestion, can -I accept the URL containing the query, so that the command
becomes:

    lei q -o ~/mail/foo --threads --dedupe=mid -I \
    https://lore.kernel.org/all/?q=f%3Atorvalds+AND+nq%3Agarbage

This way we pass both the location of the extindex to query AND the parameters
we should use, avoiding shell quoting problems?

-K
