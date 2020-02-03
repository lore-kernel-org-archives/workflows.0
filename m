Return-Path: <SRS0=3Xob=3X=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A86C35247
	for <workflows@archiver.kernel.org>; Mon,  3 Feb 2020 22:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA4F320720
	for <workflows@archiver.kernel.org>; Mon,  3 Feb 2020 22:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="oQAYfTS3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgBCWio (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 3 Feb 2020 17:38:44 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35531 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbgBCWio (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 3 Feb 2020 17:38:44 -0500
Received: by mail-oi1-f193.google.com with SMTP id b18so16494745oie.2
        for <workflows@vger.kernel.org>; Mon, 03 Feb 2020 14:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0sMCx3ovS3EsIP6wbIf3QsFwm7LJmZWURl43FcwhWyY=;
        b=oQAYfTS31v4SByJel5RwYTpqZ40zl/0ab7xsEc28If14+Bo/nYDEvs6wXB0LKZ7fSh
         dp0KVZWOortj5kNJwKCDIpRISQ2htIPUpJ6glKjR7WMzkmvXQeh9Je1W0CTdxrHpgxHo
         80qCIzaVwZY1Eyhiy58Y2/GYHrj21ubpYWlMEJVUNiwJoCTH0NL0OJVtabseJkDroAn6
         wBpCE9NNQUHOC/uSKLfrqroObMbLPeIaGFnI76a8PyEaoAv27o6rbBcs8ziof9GIvTQE
         /sltK7Kvo9g6Mysa2lcgQVPMZvEcZL/s1fn1CkJMVOR/ukBFgGPlL/M/K4gxzeQq/w18
         fovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0sMCx3ovS3EsIP6wbIf3QsFwm7LJmZWURl43FcwhWyY=;
        b=WMDcbJ7TRqAf9f0IVGAONw289rQF5gRIzLsMOPta3b9ayAG062lMsIEvrdr8vmzCWl
         2T/IqNGPyf37FmRzyCEK5SqkLGpBS27WcaNOPl6EwlLCrnU+TCSBgkltnHKHSvAT2VfU
         rVWONGjDH6yAnkCaxp+BLdOM8w/u13IyNZPrhPV+K7ukJ6/4dcAHlYKaltcAuNtES8vm
         HPHYnbrHT1tXY0Boi4CgFD+Lt5VYUrvMNTLCnP+Tazvu/Y+V0W+LaqdacTjIwVuY4Zmc
         S3D3tb10JqYP7s+NnQADImTaVfPCZ/QOoWZjGxYBOre6aZ5NJSbmuMYDci1iOmVdxGJ2
         xD9A==
X-Gm-Message-State: APjAAAXpD+rAQoCkMvmkwd/dufX7tSsQSotj5NGIPCkQ4QEShK3KMAAx
        iR+PjaZzJKF3uOqFS1p6gjnh90LUj8IsmRe0hbMSh01s3wI=
X-Google-Smtp-Source: APXvYqxCfLrHyfzhvZxJyiKj6ROE8RtxpONXkzU6r8FC6UBZupDueYeVS6gtuZkL4elxoZGC1zAQ0X40xdV744BavV0=
X-Received: by 2002:aca:3f54:: with SMTP id m81mr944569oia.73.1580769523216;
 Mon, 03 Feb 2020 14:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
In-Reply-To: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Mon, 3 Feb 2020 14:38:32 -0800
Message-ID: <CAPcyv4gdmV3Ux93C8ffTE=n2XByXFH3r7xn6MX5TgxozK=B6mw@mail.gmail.com>
Subject: Re: get-lore-mbox: quickly grab full threads from lore
To:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jan 31, 2020 at 7:01 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
[..]
> Please give it a try and let me know your feedback! You can find it here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/get-lore-mbox.py

Nice, this is probably going to replace my usage of getpatchwork [1]
because that requires a login + configuration to a single patchwork
project whereas this is any patchset from any lore list.

The ability to specify any patch in the series and pull down the full
set + cover is slick!

I assume the "get latest revision" requires that when superseding a
set that new version needs to be a reply to the first version? The
auto-supersede feature of patchwork-bot, also slick, did not require
this. Maybe patchwork-bot could reply to the old version when it sees
a supersede, in case someone forgets to thread subsequent revisions as
replies?

[1]: https://github.com/getpatchwork/patchwork
