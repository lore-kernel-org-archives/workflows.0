Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EE3C433F5
	for <workflows@archiver.kernel.org>; Mon, 29 Nov 2021 21:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhK2WCz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 29 Nov 2021 17:02:55 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]:36716 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbhK2WAy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 29 Nov 2021 17:00:54 -0500
Received: by mail-qk1-f174.google.com with SMTP id i9so24587529qki.3
        for <workflows@vger.kernel.org>; Mon, 29 Nov 2021 13:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=KTCNkmVBb9HymNYFDG9c88dlBXMMC7brYA14NvBXojU=;
        b=fMEPdkatWUK8tI4Oa/+w+9T76GtaYC3Fn4jHAgxOyFEdvrk2ZVRTFilyDEUHjuKdG0
         GZ7lWPLzgiRo5CIwujh5LXBc5G3gwJrCizxlNkxhXCJ1bQmxnJDe8V0fFLsPsjzfOWbr
         CCMVU9G5T3Vg4bBICXYopXKMmK8HtTqFNpafE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=KTCNkmVBb9HymNYFDG9c88dlBXMMC7brYA14NvBXojU=;
        b=JiwUtaN31ywFQLGHkBKoD79FgExX9OqpoIzFKW0sIHlP0kVSfhDq/+Im8gYeo2sSX8
         lpx3qQDgscbWjO3MlXWgee5Ngtvwp4OHqlrQ6+sCR9oRSEcPN3Ytqw2BwCdOv35mejrp
         9GbquwEnfQAbdVAsWRPgMO/HcTdUqdUoSI/IEGSlCsqmmTaokx8K8ozIEmtmTUxMzH/r
         8pCL8JTwTgFPCbFBgU8oiTAtnavxPHMu8bYgrWVxoSlmF9sLK7mURwI4EWSmb2ZAwW6V
         fb3xwt+k6hhvNatm9zTsKnjycXs2m5W0jM7eCNPChQIX4Nz8OADgIhBZr4KvRfh7bp8d
         0krg==
X-Gm-Message-State: AOAM5335dhboMRj1IWynHoyoOZEkMF9ToZZ66aYXDHam6cEACagXSHBz
        mJCbRIfrYg1hUFdWhadqBIgHwDV/M3NINA==
X-Google-Smtp-Source: ABdhPJyHn2IsCSlR+pW1672nt46bexWTNZrMumgPCudbMxnjVS7Sy047bYDEKGlKMAtqe6+dbH3Jeg==
X-Received: by 2002:a37:27cc:: with SMTP id n195mr41250653qkn.507.1638222996276;
        Mon, 29 Nov 2021 13:56:36 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id w10sm8933205qkp.121.2021.11.29.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 13:56:35 -0800 (PST)
Date:   Mon, 29 Nov 2021 16:56:34 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: PSA: generic patches@lists.linux.dev list
Message-ID: <20211129215634.gydsyfyhu6rhbbe2@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

We have a generically named list `patches@lists.linux.dev` that can be used as
an address for sending patches.

This can be useful for a number of reasons:

1. those maintainers already using lei [1] can list patches@lists.linux.dev as
   the mailing list address for their subsystem and receive mail sent to it
   via lei saved searches
2. mail sent to this address goes to public-inbox first, so it's likely to
   show up on lore.kernel.org very quickly, with fewest delays and omissions
3. you can use this address as an extra cc for mail sent to other lists that
   are less likely to preserve the message body as-is -- when retrieving mail
   with b4, it will give priority to the linux.dev address in the presence of
   duplicates.

Mostly, it's a dumping ground for patches. We can even use it as "THE REST"
address in MAINTAINERS to help offload some of the traffic from vger and make
linux-kernel@vger.kernel.org less of a firehose and more amenable to actual
discussions.

-K
