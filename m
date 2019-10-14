Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0017ECE587
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:41:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9625B2133F
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571060512;
	bh=ilj/rDasi0qDOvrkjUBtO/4sSade0qgcfhLsQzj4VeQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=jALVyS8TxGcG6B8OIGuCFvm4hRGPnsd0ingijTraVUdjIaOH0Ok5SmnDi86lDs7hF
	 7RLIIpTpeUsbHiRqLVvdaIR0aB5ayE3oDmpLypq3Dhu2oybMHTX5SW4ze+i4LDQtot
	 nD0LLKLGV+qvbnEmCNXIxu4GGq5VsChwdjru9adI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbfJNNlw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 09:41:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48548 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfJNNlw (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 09:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=m9OU31zIcSAEQPvnRl/LooKv3v+USLqIsMVoWWqvxrY=; b=uJOMZ8aBmHkBIZ1pjonVu1f16
        KiqmUhgLuCb6TISC7SrAf/oKIQpES9dHJT8Mr4Va6ShdWRc+04V3jfJB1+rm4tsMiWuWytJEd/+Hu
        SBevk76eLv3+Rg/UgDLJlpvM7iYTv4Y32Ck9DA+o6efKBl0cYfaoLV8Jy1dvM5YyaJkudivEXgaW3
        HjE9uIVXx4m8Zvpow984yjMBi+L9tfhsHEibyIeVVd69OSjrA9UD1Gy32xXTn7YCQpo7Lma13BYSs
        /X2b+djmi3kriLT5nkt6Vq/fEwHGkCcPrp5Q4czt3wpxVwLmgRr83IKlbB067L44YUteqZuygS8E+
        jHYHHaq6w==;
Received: from 201.47.160.77.dynamic.adsl.gvt.net.br ([201.47.160.77] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iK0bV-00053b-AK; Mon, 14 Oct 2019 13:41:41 +0000
Date:   Mon, 14 Oct 2019 10:41:32 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
        Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014104132.76b19507@coco.lan>
In-Reply-To: <20191014122637.GB5564@mit.edu>
References: <20191011.113254.1964556815296845399.davem@davemloft.net>
        <20191011155949.145f0f7d@coco.lan>
        <20191011.121153.1410013220730418292.davem@davemloft.net>
        <20191011141909.1ccb58b3@hermes.lan>
        <20191011174719.16e997f5@gandalf.local.home>
        <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
        <20191011190009.6ee15756@gandalf.local.home>
        <20191011170839.75c52ad3@hermes.lan>
        <87lftotdv8.fsf@dja-thinkpad.axtens.net>
        <874l0bk3qb.fsf@toke.dk>
        <20191014122637.GB5564@mit.edu>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Mon, 14 Oct 2019 08:26:37 -0400
"Theodore Y. Ts'o" <tytso@mit.edu> escreveu:

> On Mon, Oct 14, 2019 at 12:42:36PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
> > It should be detectable, though, right?
> >=20
> > Say you have two independently administered patchwork instances (or even
> > better, two different software packages entirely) that both subscribe to
> > the mailing lists, and compare patch content with each other. They
> > should at least be able to detect mismatches. Especially if you add a
> > sanity check before discarding duplicate message-ids. =20
>=20
> They don't even need to compare against each other; patchwork is about
> to add a feature where you can look up patches via message-id, right?
> That means it's easy enough to write a program which fetches patches
> from patchwork, and compares it to the patches found in
> lore.kernel.org.  If they don't match, then an alarm can be sounded.
>=20
> Individuals who are reviewing patches can also compare the copy in
> their inbox with the copy from lore or some other public inbox.  And
> maintainers can compare copies from lore.kernel.org and patchwork
> before they apply a patch.  (99% of the time, I actually use the patch
> from my inbox, anyway.)

It can still have man-in-the-middle (MITM) attacks between the sender and
vger.kernel.org. Please notice that using https and adding the patch
via a web interface can also be subject to MITM, as companies and even some
Countries with strong policy enforcement may have some gateway on their
infra that will prevent end-to-end encryption[1], blocking direct
client-server https tunnels.

[1] They add an internal certificate to the browsers, so that the client
will see the connection as trustful, but the infra will actually do two
separate HTTPS encryption:

	client  ---> Gateway
	Gateway ---> Server

While unlikely, nothing prevents that the patch would be maliciously=20
altered at the Gateway.

=46rom security PoV, the only way to ensure that the patch was not
altered is to have it signed by the one who wrote it.

>=20
> > This way you'd need to compromise multiple machines to achieve the kind
> > of compromise you're worried about. And you can add more independent
> > machines until you're satisfied that the risk is low enough :) =20
>=20
> Yep, exactly.  This is basically the theory behind Certificate
> Transparency[1], applied to patches.  For example, here's the
> certificate transparency report for kernel.org:
>=20
>    https://transparencyreport.google.com/https/certificates?cert_search=
=3Ddomain:kernel.org
>=20
> 					- Ted
>=20
> [1] http://www.certificate-transparency.org/what-is-ct

That won't prevent companies/governments to require the manual
installation of the gateway's certificate on their browers, in order
to be able to navigate using https.

Thanks,
Mauro
