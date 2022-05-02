Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485C1C433FE
	for <workflows@archiver.kernel.org>; Mon,  2 May 2022 15:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237609AbiEBPTK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 2 May 2022 11:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385752AbiEBPS6 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 2 May 2022 11:18:58 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAD56337;
        Mon,  2 May 2022 08:15:27 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 84B611F388;
        Mon,  2 May 2022 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1651504526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RCTuhL7vg0z+1QGj9YzW0fTK6FXGM7xv6dnkGs35qGI=;
        b=Lz5mN3rRQ2pRr0WQaodIFtzFN4PQELnb7az+nzyqwWRAtqXngoA+7RGGUrSsn9yFWm5dj5
        L3gjf8d8qtk0/Z4Y/skigo0JotUn96d4ayBXGyoCpywPu57c9j+SJzJfFXoEGI+Fbd1lyj
        tkHs7ubtuibJAqz8ujqk0/HMs6pkCjE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46FE4133E5;
        Mon,  2 May 2022 15:15:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id e2XGD471b2KSSQAAMHmgww
        (envelope-from <jgross@suse.com>); Mon, 02 May 2022 15:15:26 +0000
Message-ID: <6dad8d2b-5f58-87e0-53de-149506273c1e@suse.com>
Date:   Mon, 2 May 2022 17:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Driver graveyard
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@kernel.org>, torvalds@linux-foundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        Thomas Osterried <thomas@osterried.de>
References: <20220502071818.5101c752@kernel.org> <87ee1cxb2o.fsf@meer.lwn.net>
 <20220502081001.6135b370@kernel.org>
From:   Juergen Gross <jgross@suse.com>
In-Reply-To: <20220502081001.6135b370@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IJWeHNpaa3qEPqYuFraO3fLH"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IJWeHNpaa3qEPqYuFraO3fLH
Content-Type: multipart/mixed; boundary="------------ElODureZbSh4yqWYYLZwOGIP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@kernel.org>, torvalds@linux-foundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Thomas Osterried <thomas@osterried.de>
Message-ID: <6dad8d2b-5f58-87e0-53de-149506273c1e@suse.com>
Subject: Re: Driver graveyard
References: <20220502071818.5101c752@kernel.org> <87ee1cxb2o.fsf@meer.lwn.net>
 <20220502081001.6135b370@kernel.org>
In-Reply-To: <20220502081001.6135b370@kernel.org>

--------------ElODureZbSh4yqWYYLZwOGIP
Content-Type: multipart/mixed; boundary="------------MYmWOQMi0LRRQhJ3pBY0M46l"

--------------MYmWOQMi0LRRQhJ3pBY0M46l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjIgMTc6MTAsIEpha3ViIEtpY2luc2tpIHdyb3RlOg0KPiBPbiBNb24sIDAy
IE1heSAyMDIyIDA4OjI5OjAzIC0wNjAwIEpvbmF0aGFuIENvcmJldCB3cm90ZToNCj4+IEph
a3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+IHdyaXRlczoNCj4+DQo+Pj4gVGhvbWFz
IHN1Z2dlc3RlZCB0aGF0IGl0IG1heSBiZSBuaWNlIHRvIGNyZWF0ZSBzb21lIGZvcm0gb2Yg
YSByZWNvcmQNCj4+PiBmb3IgZHJpdmVycyB3aGljaCB3ZXJlIHJldGlyZWQgZnJvbSB0aGUg
dHJlZS4gSSB0aGluayBhIGNvZGUtY2VudHJpYw0KPj4+IGVxdWl2YWxlbnQgb2YgQ1JFRElU
UyBjb3VsZCBiZSBhIGdvb2QgaWRlYS4NCj4+Pg0KPj4+IERvZXMgc3VjaCBhIHJlY29yZCBh
bHJlYWR5IGV4aXN0IHNvbWV3aGVyZT8gSWYgbm90IGFueSB0aG91Z2h0cyBvbg0KPj4+IGNy
ZWF0aW5nIGEgZmlsZSBzdG9yaW5nIChLY29uZmlnLCBzaG9ydCBkZXNjcmlwdGlvbiwgY29t
bWl0IHdoaWNoDQo+Pj4gcmVtb3ZlZCB0aGUgZHJpdmVyKT8gRS5nLg0KPj4+DQo+Pj4NCj4+
PiBLOiBETUFTQ0MNCj4+PiBEOiBIYW1yYWRpbyBoaWdoLXNwZWVkIChETUEpIFNDQyBkcml2
ZXIgZm9yIEFYLjI1LiBEcml2ZXIgc3VwcG9ydGVkDQo+Pj4gRDogT3R0YXdhIFBJL1BJMiwg
UGFjY29tbS9HcmFjaWxpcyBEOiBQYWNrZVR3aW4sIGFuZCBTNVNDQy9ETUEgYm9hcmRzLg0K
Pj4+IEM6IDg2NWUyZWIwOGY1MQ0KPj4NCj4+IFNvIHdoYXQgaXMgdGhlIHB1cnBvc2UgZm9y
IHRoaXMgZmlsZT8gIEFuZCBtb3JlIHRvIHRoZSBwb2ludCwgSSBndWVzczoNCj4+IGlzIHRo
ZXJlIGEgbmVlZCBmb3IgaXQgdG8gYmUgc3RyaWN0bHkgbWFjaGluZS1yZWFkYWJsZT8gIElm
IHRoZQ0KPj4gb2JqZWN0aXZlIGlzIHRvIHJlbWVtYmVyIG91ciBoaXN0b3J5IHRvIG1pbmlt
aXplIG91ciBjaGFuY2VzIG9mDQo+PiByZXBlYXRpbmcgaXQsIHNvbWV0aGluZyBtb3JlIHBy
b3NlLW9yaWVudGVkIG1pZ2h0IHdvcmsgYmV0dGVyLg0KPiANCj4gVG8gYmUgaG9uZXN0IEkg
Zm91bmQgdGhlIGV4aXN0ZW5jZSBvZiB0aGUgQ1JFRElUUyBmaWxlIHVzZWZ1bCB3aGVuDQo+
IHJlbW92aW5nIHN0YWxlIE1BSU5UQUlORVJTIGVudHJpZXMuIEEgbW92ZSBzZWVtcyBsZXNz
IGhvc3RpbGUgdGhhbg0KPiBhIGVyYXN1cmUgKHVzaW5nIGEgdmVyeSBicm9hZCBkZWZpbml0
aW9uIG9mICJtb3ZlIiBpbiBjYXNlIG9mIGRyaXZlcnMpLg0KPiBBbnl0aGluZyB0aGF0IG1h
a2VzIHBlb3BsZSBmZWVsIG1vcmUgYXQgZWFzZSB3aGVuIEkgcmVtb3ZlIHRoZWlyIGRyaXZl
cg0KPiB3b3VsZCBiZSBoZWxwZnVsLg0KPiANCj4gVGhlIG9ubHkgcHJhY3RpY2FsIChpLmUu
IG5vdCBhcm1jaGFpci1wc3ljaG9sb2d5LWJhc2VkKSB1c2UgSSBjYW4gdGhpbmsNCj4gb2Yg
aXMgaWYgc29tZW9uZSBpcyBhYm91dCB0byBzaXQgZG93biBhbmQgd3JpdGUgYSBuZXcgZHJp
dmVyIHRoZXkgbWF5DQo+IGdyZXAgdGhlIHRyZWUgZm9yIHRoZSBuYW1lIG9mIHRoZSBIVywg
YW5kIHRoZXkgbWF5IGZpbmQgdGhlIGdyYXZleWFyZA0KPiBlbnRyeS4gU28gSSB0aGluayBs
aXN0aW5nIHRoZSBleGFjdCBIVyBzdXBwb3J0ZWQgaXMgdXNlZnVsLiBUaGF0IHNhaWQNCj4g
YXMgSSdtIHdyaXRpbmcgdGhpcyBJJ20gcmVtaW5kZWQgaG93IG9sZCB0aGUgaHlwb3RoZXRp
Y2FsIEhXIGluIHRoZQ0KPiBwcmV2aW91cyBzZW50ZW5jZSBsaWtlbHkgaXMuDQo+IA0KPiBJ
IHVzZWQgdGhlIG1hY2hpbmUtcmVhZGFibGUgZm9ybWF0IGZvbGxvd2luZyBDUkVESVRTLiBJ
IGZpZ3VyZWQgQ1JFRElUUw0KPiBzZXJ2ZXMgbm8gcHJhY3RpY2FsIHB1cnBvc2UgZWl0aGVy
IHRvZGF5LCBpbiBoaW5kc2lnaHQgdGhhdCdzIGEgYml0DQo+IGFoaXN0b3JpYy4NCj4gDQoN
CkluIGNhc2Ugc29tZXRoaW5nIGxpa2UgdGhpcyBpcyB3YW50ZWQsIG1heWJlIGl0IHNob3Vs
ZCBub3QgYmUgbGltaXRlZCB0bw0KZHJpdmVycz8gSSB0aGluayBsaXN0aW5nIGRlc3VwcG9y
dCBvZiBmZWF0dXJlcyAoZHJpdmVyLCBhcmNoLCBzeXNjYWxsLA0KZnMsIHdoYXRldmVyKSB3
aXRoIGtlcm5lbCB2ZXJzaW9uIGFuZCBtYXliZSBjb21taXQgd291bGQgYmUgYmV0dGVyLg0K
DQoNCkp1ZXJnZW4NCg==
--------------MYmWOQMi0LRRQhJ3pBY0M46l
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------MYmWOQMi0LRRQhJ3pBY0M46l--

--------------ElODureZbSh4yqWYYLZwOGIP--

--------------IJWeHNpaa3qEPqYuFraO3fLH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJv9Y0FAwAAAAAACgkQsN6d1ii/Ey+S
ggf/fjGf2O7iwk0vZnGMPRkWd6dZlbUGiQTKoaqGSsIuL/0QwxWXu9DG5wDe1QDpo2Zm2EfYq/ks
tdurZid2DOq/CP9esb/ebjh5Jnhp4YAm6gnV7Xf8Sml1gPDiKlDuE5T0u/lnhiXmztAMVdp+HiK+
6HhP2jxl1+KH+ijf5eJXIqc0OTbA4q/7o9EetIi8BkUk8wrhIZ/F3x33bEt4gXKBeqjbxpgQ+aE1
wFrgcA8CMn/ZXJtcz0kGW1oqCPqGS3vrtm2mrbTxUUSB2f8cEGu3UB0nWi2Embw9OmTiTWm+nh2X
OART8knqjW9iJ9ahzYufPtVdAtRlwbxWU+8uoB1AZQ==
=Qi1J
-----END PGP SIGNATURE-----

--------------IJWeHNpaa3qEPqYuFraO3fLH--
