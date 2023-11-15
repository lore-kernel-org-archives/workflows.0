Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABFEC2BB3F
	for <workflows@archiver.kernel.org>; Wed, 15 Nov 2023 17:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjKORtg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Nov 2023 12:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjKORtg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Nov 2023 12:49:36 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C4C196
        for <workflows@vger.kernel.org>; Wed, 15 Nov 2023 09:49:33 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6c115026985so7238202b3a.1
        for <workflows@vger.kernel.org>; Wed, 15 Nov 2023 09:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700070573; x=1700675373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rD3WiIjcHVWht+bRoyz5WPCyUUboXlGuOAtDZ7BuR4Y=;
        b=HL7teC/dFsL6nhWGP8XRvC3I1hAH1404skG3QW+KqliDXcK3kiO6YDQ3JnutiTzpNa
         MDUFtqnMl8mS5Rb0XdsPJ9uXJ6X1zmQqu/hCDJRYK7C0Nb9UVzBj2YADferoK9nr1MZ6
         DtnJ93aBiqq8q24OHqy/JNRcz6FbegsdyNd44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700070573; x=1700675373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD3WiIjcHVWht+bRoyz5WPCyUUboXlGuOAtDZ7BuR4Y=;
        b=YtwFgTOGK8dZImz4xznu/GRhepXgaWvlbwDZ9m/7mMr8UPKGtqCJkMKGA+yxq9HjQC
         Wib8G+ag6O2aqSancYcw94BDgTvhgZOxvf5ra9mCnW5e7tfJhXQMk/tPGPq9zXMIoKgj
         UWYkfMSP+tLHZTiX9JP/NyvIU9S5Ct5dPOQs/vDVcp5a5ANt5Zfp7vkwujUGSQ/4qwmi
         XAkwNWT+TRFaPpG+pqTEfHuCbA7cnXXZfgFRPG0eIdYBszry1F+oTVmMXJqraxro7NjA
         bsnP0FJArPRMAWH2268C3/Q3Cy+po0gUc4FF8V/hHbZ4twy/PggLKi8PwGrHxEbloOXW
         eOag==
X-Gm-Message-State: AOJu0Yz+E5qANTpRoPVLhgDSXkJHKduTZOZLLDLUw8qRwSrwdwFp3ibI
        hcZoHuSntgOxyLNjTdYE2MG/0Q==
X-Google-Smtp-Source: AGHT+IGpmlqewDarAywsnMa7n04xYqUuCS4rlMCE2QKXA46apMCUxu5GyilgrdJ+vePrD+IEy8Q6pg==
X-Received: by 2002:a05:6a20:7487:b0:148:f952:552b with SMTP id p7-20020a056a20748700b00148f952552bmr15559858pzd.51.1700070573014;
        Wed, 15 Nov 2023 09:49:33 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j16-20020a62e910000000b0068e49cb1692sm3068013pfh.1.2023.11.15.09.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 09:49:32 -0800 (PST)
Date:   Wed, 15 Nov 2023 09:49:31 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: improve the base commit
 explanation
Message-ID: <202311150948.F6E39AD@keescook>
References: <20231115170330.16626-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115170330.16626-1-bp@alien8.de>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Nov 15, 2023 at 06:03:30PM +0100, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> After receiving a second patchset this week without knowing which tree
> it applies on and trying to apply it on the obvious ones and failing,
> make sure the base tree information which needs to be supplied in the
> 0th message of the patchset is spelled out more explicitly.
> 
> Also, make the formulations stronger as this really is a requirement and
> not only a useful thing anymore.
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

Yup, I wonder if making "--base=auto" a default in git might be a good
idea too?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
