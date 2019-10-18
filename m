Return-Path: <SRS0=I4mM=YL=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01A1CA9EA0
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 15:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B59BE2245A
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 15:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="IRMASeta";
	dkim=pass (2048-bit key) header.d=nyu-edu.20150623.gappssmtp.com header.i=@nyu-edu.20150623.gappssmtp.com header.b="B5P0CS8C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409169AbfJRPyN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 11:54:13 -0400
Received: from mx0a-00256a01.pphosted.com ([148.163.150.240]:25634 "EHLO
        mx0b-00256a01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2409172AbfJRPyN (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 18 Oct 2019 11:54:13 -0400
Received: from pps.filterd (m0094546.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9IFpki3116187
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 11:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=20180315; bh=8WzOh4VxFi+gRpyaJOrI+xwl81ARGu8H2iil3vR4U0Y=;
 b=IRMASetabSmu/GjHAE/fqblY8RHyvO8SlwgXEROQILMaVDtpXbuH5Kzozeh584vjMArJ
 MpKKd/JnGCCiN2xccEOWXIVAzffifzSL/LY6tbWhUTWyYoIKZpJWtbhq09bQubgwQA4W
 k9T/F+3BaDVG/EyBjHG2KqnApIhFAZ39byDtZW5NDVJgCdxNgA/YZABCtgkjK5W+j7Wx
 RdpSOKuXIg3LJjZPOluCH0HTNrGj8Xv96f6+NDkq9BFQpGIpsx+JNaQPFpYbUIWU2J2I
 W6Bd8OWbX6oNm7CcAWuivFPHQavVAr6J+e4QxhHdd0SdiBSfjqldKfHIby+uAvTP9qJf WA== 
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
        by mx0b-00256a01.pphosted.com with ESMTP id 2vq7yk7jm2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 11:54:12 -0400
Received: by mail-qk1-f197.google.com with SMTP id z128so5956896qke.8
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8WzOh4VxFi+gRpyaJOrI+xwl81ARGu8H2iil3vR4U0Y=;
        b=B5P0CS8CKsNBgGRhAuzrX9PTFPMUAoCfIZtNkU05d3+xh5hNaJ248LtYbxm9Lj/ycZ
         LcXOVFxKAhUoazCiYckSPjNEmQAcOOsy0F6qRp3/J5H3exiv7wtIBWrwc3soNSrX9vVz
         tAOY+7KGv8XJbg+N/vwbwoEvBASsS+ap9Ym0Wh+z7ww5ExjWOi0n1z68bGu8zuGmop+o
         TS8grnnF/Auk/MXsDxSLG1whzDjqXOcbk0d2xHxkKCzZcs2QjNApfNg92bqjtHdvNc3R
         IXaZdamejE04wheJDFDk8SMEfQMAJJTLJ48QypQPuqN3LHyHJmKRhZSrw2klkWRIr1WD
         /G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8WzOh4VxFi+gRpyaJOrI+xwl81ARGu8H2iil3vR4U0Y=;
        b=R5BIw5HmMDepRcmYa1A4D/9rEQEjvaD9kfeKes3tPZAdbnIJm0MXbMEItYGOPpifz+
         d6e3vqbXPW2JOxPasZ7+jUXsyPEOiV7V/1C3r9AA0a/3i6wynkDqS98k+svYLwN50wmD
         AylR8SKCfb2ygDjhdXgP4jPdFaGGRQ4Lo6grc+K23UDAU7mimwxrJEqknjxSuX6XA0C3
         GQi9plk5cO8cDiw0JqxEun8P0qQ5Gt5qql5gAT62ZYknH6UaYEYyDTw+vNhPXsT585vZ
         q3z21W9itsYFHLgwHIUr46RlVRtGiUbk/dLKr0r5VJUfttPFaoZQgEnbPVopGaJGFZbc
         OvIg==
X-Gm-Message-State: APjAAAV3gd+NgB7XftFFTBWGCAA2DnUxMlYj3WlSo1sc88AtyccpQLz7
        v2izI6v1T28chJ2kV76mgoCcu9aJLAfH5rR8YL0Wf8+agUXjOgAOqZuT221Tq1xHihERUWG65UQ
        qEgOVEN0INNa8BDr9l7o=
X-Received: by 2002:a0c:fa91:: with SMTP id o17mr10671192qvn.142.1571414051275;
        Fri, 18 Oct 2019 08:54:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpdpx+YqP9G6AgSLbPFZYcnbAE0igK0+Neer7IkNmX+LQFwmzaKk2LqAsNvkoquqj/CkxRZw==
X-Received: by 2002:a0c:fa91:: with SMTP id o17mr10671172qvn.142.1571414051101;
        Fri, 18 Oct 2019 08:54:11 -0700 (PDT)
Received: from LykOS.localdomain (216-165-95-130.natpool.nyu.edu. [216.165.95.130])
        by smtp.gmail.com with ESMTPSA id k13sm681936qkg.57.2019.10.18.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 08:54:10 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:54:09 -0400
From:   Santiago Torres Arias <santiago@nyu.edu>
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     Willy Tarreau <w@1wt.eu>, workflows@vger.kernel.org,
        Git Mailing List <git@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Eric Wong <e@80x24.org>
Subject: Re: email as a bona fide git transport
Message-ID: <20191018155408.dk4tsjrne42ufpvv@LykOS.localdomain>
References: <b9fb52b8-8168-6bf0-9a72-1e6c44a281a5@oracle.com>
 <20191016111009.GE13154@1wt.eu>
 <20191016144517.giwip4yuaxtcd64g@LykOS.localdomain>
 <56664222-6c29-09dc-ef78-7b380b113c4a@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5sfrrmuyqloyaxm7"
Content-Disposition: inline
In-Reply-To: <56664222-6c29-09dc-ef78-7b380b113c4a@oracle.com>
X-Orig-IP: 209.85.222.197
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=754 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=7 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910180143
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--5sfrrmuyqloyaxm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Seeing how large this signature is, I have to admit that I am partial to
> Konstantin's suggestion of using minisign. This seems like something
> that could be added to git as an alternative to gpg without too much
> trouble, I think.
>=20
>=20

I wonder how big the pgp payload would be with ed25519 as the underlying
algorithm. AFAICT, the payload of a minisign signature vs a signature
packet have almost the same fields...

--5sfrrmuyqloyaxm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkDurc2QOttZVM+/zRo8SLOgWIpUFAl2p4CAACgkQRo8SLOgW
IpWCjBAA0Vj5QGil9RloqJJ3wtJwtCnJCmTogWUL1Aoh4fjllBRsl5Zo/MM+ttl8
mLMGtLEpTsLwyVbgtrDNUlttd8RQRfmO5N+/QdowDchWLPt9bdbnZZ3S/PSCFfZs
3jbWxJ/XTg9n5fpu111Vyl9O4A/0ZODqRJHDjvhg6dX04vlIj+s/UYsF/9mBvCEy
kBqzdNgGqZ4nQMrvYQTT6kVA39jeF4PDMzg7hLpSzvXI6jTlEyEEyd9er7y22gdL
a0qTjXVGzc5TvAUjBZ/RMbBa9o+Jkg3WwZwmvGKosScHqPIEpCp2i+iL/NiQnid2
OxwzidTRstzc5gwjHTSaFtEw9i8YqunOZhUpoTS4/AG4RaaepsetDTpUE6Ckax/J
MG6/ZbnfXVwGXmH5aMiuPK/o098r/dcB/3HL5KkMGuo5eF+3H0uFd3ylpBBfuv++
DD+h9bO02I0ktNIj9p99W8Ze/66XSe/9GzOvG9jldDTBBSW92S1M5M+ul3ko4IEt
TL0wEMYPq/81kM3hfpZYbzmL4NcY6jUIc+UvnpwczfhU3DSTA3pS+UpBXO3njuOu
8OtWJm3rcAaJaQ+U3Pzfms4jR0uSNmgdiF/LRgMxnmBu5mQSIKiAFJ7iqIzMJXuA
djhM8UQCu0rQwgFr7SB2ZJRsU+Ec3yTfKGWa1q0gBoz4zdaYfmU=
=zbEw
-----END PGP SIGNATURE-----

--5sfrrmuyqloyaxm7--
