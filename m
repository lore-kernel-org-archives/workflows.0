Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7068C433F5
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:04:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A80FA61A03
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhKPIHD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 03:07:03 -0500
Received: from out0.migadu.com ([94.23.1.103]:62818 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231664AbhKPIHB (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 16 Nov 2021 03:07:01 -0500
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
        t=1637049843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ci84CiYOfhSV9w4FePu27o2xno6ZubPHHzFQpMf+IYc=;
        b=a1G4fFzFc6spFcMK+aARfcmensGlh6cOIoS+RMotshOastnN6iYHlxKrHYkgVxJL1tDc+c
        w/dVXtZhDpWg+iHT7LOdyNLfD3Bx30GBlvpmLFVbCZlsH+h4hQz1F+cEhrGQXudu32EgIM
        KQbvtiKijI2sFs72kNgAwDdtgBc3t6U+ca5k7m0uofu3CFXD4/Z48TEXk2va72P8kyGHQW
        Agf5L9L8GGCURk82oQT5+ZdIQZOOiBNyK2Td1GB5glCn0mpcYx6sIXGCwMqyw0PDisqcuw
        P4gnjq0CRLNEpbr5V42ViZaVRZQx+8hQC/bQ1cZ/OoaS+LCJBViSq+eZR6wz0Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 16 Nov 2021 09:04:03 +0100
Message-Id: <CFR1QJQ34CD5.15GF612X2CADO@taiga>
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc:     <workflows@vger.kernel.org>
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
 <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
 <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
In-Reply-To: <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: sir@cmpwn.com
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Apologies for being That Guy, but: but have you considered simply
leaving gmail?

I recommend Migadu: https://www.migadu.com
