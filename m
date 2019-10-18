Return-Path: <SRS0=I4mM=YL=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2B2CA9EA0
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 17:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FCBA222CC
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 17:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="spxn9D7b";
	dkim=pass (2048-bit key) header.d=nyu-edu.20150623.gappssmtp.com header.i=@nyu-edu.20150623.gappssmtp.com header.b="LM4UQekB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbfJRR1W (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 13:27:22 -0400
Received: from mx0b-00256a01.pphosted.com ([67.231.153.242]:18622 "EHLO
        mx0b-00256a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2410643AbfJRR1H (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 18 Oct 2019 13:27:07 -0400
X-Greylist: delayed 5776 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Oct 2019 13:27:06 EDT
Received: from pps.filterd (m0119692.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9IFl29D193130
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 11:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=20180315; bh=9+xKMFbQNKCSpvT83DA5CHZgUvR/cH/zTVpq6JGVS1o=;
 b=spxn9D7bZ2ZkuS36M1QuEIsG2+hs1cRYg84wWUOvCTYqRKQUT5CIFCFnli/L1OFmvJ8d
 K47PQNQey75haJs+RnBxsphJvgKhfEbldOom8OSrbQQQ6irI4wdrItZ4M0461/vhN2Vc
 N71M3ptUxK1TIGJ5V6djXG/A7uWoNtnA9ydQwHmM5P0tb6bjb8Trr0J6hPDVNg3CmV03
 34roV/niOhOCj3OMvLMPCCsduqgiK+WK83d99zl6hv8dFQQQlaIkuCadC9itY4IMzA+k
 S3m6WHyKec/O4YAZd5SLutYyULmmgrege2tj33bI/BJCvs9qK6yWQ3QBzsxih1ZnvdMN 9g== 
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        by mx0b-00256a01.pphosted.com with ESMTP id 2vnp4tphna-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 11:50:50 -0400
Received: by mail-qt1-f197.google.com with SMTP id f15so6292705qth.6
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9+xKMFbQNKCSpvT83DA5CHZgUvR/cH/zTVpq6JGVS1o=;
        b=LM4UQekBQG9od3pTS1IYpOjYyXl7i3cTuXocPTIy6SUaXnn1klN2wgcB4JNLEzeC5d
         ZdqF0litBipOBBMml6FfIiMcPpte9/Q/gnlVL+jcJUmMf5WHFdUbgv2xanFRPr2G6jmj
         6Hd5FsUJFRhyHSNMQD7IhbkqfbaWDITSsHOcoavx15c2DbjUKYMXa/rUNxGscXDaZ7xt
         ijVMBr3vVc6ET4L4Q9aEmodHCTTJIzXSlylV6AMqBXHdzE1nRps1K6yaDQESc5lou8PQ
         r3NRdRaNr8oX9hCFbgJdKv53bYEOYvU0Vi7y/A3BSB+x/t8bC5A+jImTwpJhBo7tiQec
         CgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9+xKMFbQNKCSpvT83DA5CHZgUvR/cH/zTVpq6JGVS1o=;
        b=RsYHQNDTjXvJooM92daj9qVFB55vXBwRyS7zJiDPRbkDMW57icgrzC7L0EAS9sYjJ/
         Uw+GzZqTGwRsSOsOXLw5RYRBi8lrkeaBZny+Cx2S2Al1ZQbytZuklDLGNpW+v++SopCq
         1Nlmix4uxjkktCXnJKk1g6NQCIFJgRskyS7Q38kuWx5YL2n8VwAtbihR4j06U4isCCO2
         LQCGK3QGklTaaIIe1PsmQbGT0liO8V80wnHHlXLQukGsiANUFUt+WsqJBz3UlLKC/tGn
         LqENquHsSt5eG8jhZr2NJBNXkYehgNSNqLTXcHeWKIOS4I4m/VuCgOrTplLUqaIq4oNK
         z3kQ==
X-Gm-Message-State: APjAAAX6UGIuYlX8jSOOMmCoPgjChorg+DpoGD40+WK7oJXPFI/mrCpN
        Huy4vlQqnUrWWyR4kvbklcZ+H+CjfvEZKs0X0CLJrIsMEfHdOv3pmRkFzjJvWOx3C7amFFnSo68
        y6pNEJvWIh6T/zblgR9I=
X-Received: by 2002:ac8:748c:: with SMTP id v12mr10106104qtq.318.1571413849718;
        Fri, 18 Oct 2019 08:50:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyS5e2Kp0uj524sxBknKz3gcGbQ1WTMVFXzjXVRs1TvFmlS37P7nFrgW24GLa+R5Kd8jtK3w==
X-Received: by 2002:ac8:748c:: with SMTP id v12mr10106083qtq.318.1571413849463;
        Fri, 18 Oct 2019 08:50:49 -0700 (PDT)
Received: from LykOS.localdomain (216-165-95-130.natpool.nyu.edu. [216.165.95.130])
        by smtp.gmail.com with ESMTPSA id 54sm4236459qts.75.2019.10.18.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 08:50:48 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:50:48 -0400
From:   Santiago Torres Arias <santiago@nyu.edu>
To:     Nicolas Belouin <nicolas.belouin@gandi.net>
Cc:     Willy Tarreau <w@1wt.eu>, Greg KH <greg@kroah.com>,
        Vegard Nossum <vegard.nossum@oracle.com>,
        workflows@vger.kernel.org, Git Mailing List <git@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Eric Wong <e@80x24.org>
Subject: Re: email as a bona fide git transport
Message-ID: <20191018155047.id6r57komlejatvh@LykOS.localdomain>
References: <b9fb52b8-8168-6bf0-9a72-1e6c44a281a5@oracle.com>
 <20191016111009.GE13154@1wt.eu>
 <20191016144517.giwip4yuaxtcd64g@LykOS.localdomain>
 <20191017204343.GA1132188@kroah.com>
 <20191017204532.GA6446@chatter.i7.local>
 <20191018013029.GA1167832@kroah.com>
 <20191018015447.GB6446@chatter.i7.local>
 <20191018025215.GA15777@1wt.eu>
 <4ea21178-0cac-e958-7c69-ad5b4a74e6b5@gandi.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yq6u5evjdh75pppc"
Content-Disposition: inline
In-Reply-To: <4ea21178-0cac-e958-7c69-ad5b4a74e6b5@gandi.net>
X-Orig-IP: 209.85.160.197
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910180142
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--yq6u5evjdh75pppc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Oct 18, 2019 at 08:34:17AM +0200, Nicolas Belouin wrote:
> On 10/18/19 4:52 AM, Willy Tarreau wrote:
> > On Thu, Oct 17, 2019 at 09:54:47PM -0400, Konstantin Ryabitsev wrote:
> >> On Thu, Oct 17, 2019 at 06:30:29PM -0700, Greg KH wrote:
> >>>> It could only possibly work if nobody ever adds their own
> >>>> "Signed-Off-By" or
> >>>> any other bylines. I expect this is a deal-breaker for most maintain=
ers.
> >>> Yeah it is :(
> >>>
> >>> But, if we could just have the signature on the code change, not the
> >>> changelog text, that would help with that issue.
> >> We totally should, and I even mused on how we would do that here:
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__public-2Dinbox.=
org_git_20190910121324.GA6867-40pure.paranoia.local_&d=3DDwICaQ&c=3DslrrB7d=
E8n7gBJbeO0g-IQ&r=3DyZMPY-APGKyVIX7HgQFZJA&m=3D-7NJMybpa_bV7Y1FxWmqo1cUHOsD=
XAsRR1vvpQmYhyI&s=3DiFHNwBfYAPr---qMdv0mvKQAxqjXxvf1mAiAYZG6DIE&e=3D=20
> >>
> >> However, since git's PGP signatures are made for the content in the ac=
tual
> >> commit record (tree hash, parent, author, commit message, etc), the on=
ly way
> >> we could preserve them between the email and the git tree is if we nev=
er
> >> modify any of that data. The SOB and other trailers would have to only=
 be
> >> applied to the merge commit, or migrate into commit notes.
> > There's also the possibility to handle this a bit like we do when adding
> > comments before the SOB: a PGP signature would apply to the text *befor=
e*
> > it only. We could then have long chains of SOB, PGP, SOB, PGP etc.
> >
> > Willy
>=20
> I don't think it can work that easily as the signed content is not just
> the message.
> It would need git to support nesting signatures and to allow amending a
> commit without
> touching the signature and to allow adding one to cover the new content
> and to have a
> way to verify every step.
> Moreover you won't be able to reparent the commit as a maintainer (wich
> I think is
> also a deal-breaker)

For reference, we did something similar here[1]. I'll acknowledge it's
somewhat of a niche use, and there's a danger with multiple signature
types that could mean many different things...

I do wonder if an over-lying tool could probably provide with more
granular verification over mutiple gpg payloads inside of a commit...

Cheers!
-Santiago.

[1] https://dl.acm.org/citation.cfm?id=3D3196523

--yq6u5evjdh75pppc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkDurc2QOttZVM+/zRo8SLOgWIpUFAl2p31cACgkQRo8SLOgW
IpWOaw//QlR+/AOs1izZ0TZjqK63RlQ38/neyUS1tFB9jMvGLWeGfvG5mr5diP73
ZctbE3pON/666JNhcbP8PVYQBKc8tQxugTTVAMLIUUSPLUS6OyIKWCqa0iXKw7e4
4sDRC23nduKKmGAwUx4uwJtZmak6/U/e5K5izdp23GyQG+6ff8hmZ6y1nugaWbO/
9+qbULTLgoZVC4icgfVcHi+6BkRCO08P9wwB7KiSR8jmaqZ/+hSxu2trpl9tF1Nk
GU9T0qmMtAHA+rXkkJxvrJcCnMarLjElKzVnEJpzrokxJeH7TinvMseRA7FY7XkK
/2e83EKxqBPsCJXx+A3XAOpKCzp7GjljXvyYB6z3gBZNvahBDebq/wc1rsA4p7A4
FJkv4qTuO3OxmC2LGRawK1e5hj5spx9GFwFPH9ZezyvYh1YXQFU1Oqs19BCI+UHA
qYB3JwojV3xSTDkRvUJY4Ma5jBPajlLdIbvjnTehiHsBz6/BJEnQPp+UxB+769Ny
3z7pMFH489y2EhmrUTA6AeZ2Pcp/dwECNiZpCRqmmPDVC+UHw2Le+k9A/UYOwVaD
DYab1hDK3dtUMfleh3d6etF8deOxD7wtc/4PRkUrhnwgbfRzg5zv8f0amitf4/+8
QL0C6UE6/Y34WqBcFmLA/cFRVnvWGK2xhL5bnshIgKRAXnUcbvM=
=kV6w
-----END PGP SIGNATURE-----

--yq6u5evjdh75pppc--
