Return-Path: <SRS0=QiH3=3D=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC497C33C9E
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 19:16:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B402E24656
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 19:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="hevBVe1e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgANTQh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 14:16:37 -0500
Received: from mail.cmpwn.com ([45.56.77.53]:58474 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgANTQh (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 14 Jan 2020 14:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1579029396; bh=ZO3sw8cHadrBPBvvXMlil26EG3ilmgoy5DmPrGeU8B8=;
        h=In-Reply-To:Date:Cc:Subject:From:To;
        b=hevBVe1em+iJBhEmSVF6gnCl0i+6F5UYXyoT115QDr8Kb/rAn8mTqsT4imDhaf/gm
         aiLQA3nuZSHoZGkdnqxpmLuPF+55bvGLS7Gb9Gvke2QQi+YaWTjpfStxBiu+Q7EFxR
         og8wP+OqoDbqsQBjhRZ/xjL3i2ONchQqNTzIqF7o=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <CABhMZUUaEj7fme6OVa4sQmrUSYpumG-t-1KeACdFq-UDks5wdA@mail.gmail.com>
Date:   Tue, 14 Jan 2020 14:14:16 -0500
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        <workflows@vger.kernel.org>
Subject: Re: matrix.org as a replacement for IRC?
From:   "Drew DeVault" <sir@cmpwn.com>
To:     <bjorn@helgaas.com>
Message-Id: <BZVR5M9SVTXV.1642VEAVLDJ2B@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue Jan 14, 2020 at 1:13 PM, Bjorn Helgaas wrote:
> I'd never heard of matrix.org and don't have an opinion either way. I
> do find IRC useful. Proxies make it much more useful, and if I have a
> choice, I'd rather not pay $50/year to irccloud just for a permanent
> presence.
>
> I'd be interested to hear the details of your NACK, because they'd
> likely be informative and useful to me.

$50/year is offset by one fewer cup of coffee per month.

In any case, bouncers are not as necessary as they might seem. The idea
of an infinite backlog encourages you to keep up with discussions you
missed, which is a bad way of approaching IRC. Docs don't live in IRC,
projects don't live in IRC, tickets don't live in IRC - any discussion
that people shouldn't be fine with missing should be summarized and
forwarded to a more appropriate medium.

I use a bouncer mainly because IRC is such an important part of my life
that it's helpful for organization, and it's nice for people to be able
to drop me a quick note while I'm offline. Nice, but easily replaced
with email for anyone without a bouncer.
