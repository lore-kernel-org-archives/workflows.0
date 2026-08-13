Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC6377ABD;
	Thu, 13 Aug 2026 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607239; cv=none; b=ouJfQFk6A71hdiVszi0gjRYxQ0URs4lEKs88LpM1xHERcimSruUAnQTjRZWJuAYsqhv7m+Gac7fnN67NE8Yt+RShD971K6humJ5YQPvot/GhwuC0/wqGCzxQErq4uFZYjG+Znv12HuVlcV1qn8PvmZCm8D1Y6qffc4rcpql9K90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607239; c=relaxed/simple;
	bh=GqZguSNl6cSFVhdIhgJxOzIrWtYZHdP7ToNBuuUv+7U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eaplW00RUweJI7PMDSKJKYFh06Kod40FZ3fvTM2mdGxHaQBeX5C3sJYE3oN43iX4WKOQKB3ohR3h5p3wkUBVtS5P11348mgOXsTMX1rprugI1jUjvBZEUD9xXpwkCOXNI0XYrpD172U7aHpEmyrf1Mchuxij2+M8CgESiAK2WlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lQjRpHw8; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lQjRpHw8"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hLHWP4KqczMlQH;
	Thu, 13 Aug 2026 09:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786607233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqZguSNl6cSFVhdIhgJxOzIrWtYZHdP7ToNBuuUv+7U=;
	b=lQjRpHw8P/f1ipfBVpGjvImrW0ECByiMwYhbt9n6WOHKNxrck33ClyStLjJoxEQbmly3HX
	vA1f0XAT86RMIq0Pob6Vo86fS1ALJC7ip+PhfeYzn1oFZajnHlqDBdi0lFoOrWH/0qm0xG
	mv8QM4RVgCscDJEYUGGRw9DJa1DNxvJ1/cTeejUxWwPBiU0w/ShV9vocNTfee62iCYNc8+
	uCX5RPqvyVjcdkTG/S6FLgNw9qdYzMR8uNg5pXV0nYI3vhfcbkwz0wVm0keTapa56KoGou
	UDFihoIqiNa2P2tS/SXxCauYI6bGRDXSwZ1kxjvjTm/tlBLNW49xgliUF3f9pw==
Message-ID: <760d33b80873a2d62c72c54cd7abbdb77505cfb6.camel@mailbox.org>
Subject: Re: [PATCH 3/5] Docs: software-requirements.rst: add lzop, lzma and
 ip-route2
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 13 Aug 2026 09:47:10 +0200
In-Reply-To: <20260812122149.1635408-2-manuelebnerli@mailbox.org>
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
	 <20260812122149.1635408-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: tf6jh1y3qqq4fhpwbgnacfpr3hi3yy1g
X-MBO-RS-ID: e490ab897ac08de545c

T24gV2VkLCAyMDI2LTA4LTEyIGF0IDE0OjIxICswMjAwLCBNYW51ZWwgRWJuZXIgd3JvdGU6Cj4g
bHptYSBpcyByZXF1aXJlZCB3aXRoIEhBVkVfS0VSTkVMX0xaTUEgc2V0IHRvIHkKPiBsem9wIGlz
IHJlcXVpcmVkIHdpdGggQ1JZUFRPX0xaTyBzZXQgdG8geQo+IGlwLXJvdXRlMiBpcyBtZW50aW9u
ZWQgaW4gc29mdHdhcmUtcmVxdWlyZW1lbnRzIGJlbG93Lgo+IAo+IGFkZCB0b29scyB0bwo+IMKg
c29mdHdhcmUtcmVxdWlyZW1lbnRzLnJzdAo+IMKgdmVyX2xpbnV4Cj4gCj4gU2lnbmVkLW9mZi1i
eTogTWFudWVsIEVibmVyIDxtYW51ZWxlYm5lcmxpQG1haWxib3gub3JnPgo+IC0tLQo+IMKgRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL3NvZnR3YXJlLXJlcXVpcmVtZW50cy5yc3QgfCA0ICsrKysKPiDC
oHNjcmlwdHMvdmVyX2xpbnV4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc29mdHdh
cmUtcmVxdWlyZW1lbnRzLnJzdCBiL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zb2Z0d2FyZS1yZXF1
aXJlbWVudHMucnN0Cj4gaW5kZXggNjlkMzFhM2I1YmUzLi41ZmRmY2Y2YTBjMDEgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3NvZnR3YXJlLXJlcXVpcmVtZW50cy5yc3QKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc29mdHdhcmUtcmVxdWlyZW1lbnRzLnJzdAo+IEBA
IC00Nyw5ICs0NywxMiBAQCBHTlUgbWFrZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNC4w
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFrZSAtLXZlcnNpb24KPiDCoFsuLi5dCj4gK2lw
LXJvdXRlMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDYuMTQuMMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlwIC1WCj4gwqBbLi4uXQo+ICtsaWJsem1hwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDUuOC4xwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsem1hIC1WCj4gK2x6b3DCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMS4wNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
em9wIC1WCj4gwqBbLi4uXQo+ICt4esKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgNS44LjHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHh6IC1WCgpJcyB0aGlzIG9rIGluIG9u
ZSBwYXRjaCBvciBzaG91bGQgaXQgYmUgc3BsaXQgdXAgaW4gb25lIHRvb2woc2V0KSBwZXIgcGF0
Y2g/Ckkgd2lsbCBwcm9iYWJseSBhZGQgdG9vbHMgZm9yIFt2Ml0uCnN5c2xpbnV4ICg2LjA0KSBh
bmQgZ2VuaXNvaW1hZ2UgKDEuMS4xMSkgc28gZmFyLgoKSSBqdXN0IHRvb2sgdGhlIHZlcnNpb24g
bnVtYmVyIG9mIG15IHN5c3RlbSwgYnV0IGl0J3Mgbm90IHRoZSB3YXkgdG8gZG8gdGhpcy4KSSdt
IG9wZW4gdG8gc3VnZ2VzdGlvbnMgZm9yIHRoZSB2ZXJzaW9uIG51bWJlcnMgaXRzZWxmIG9yIGZv
ciBhIGFwcHJvYWNoIGluIGdlbmVyYWwuCgpUaGFua3MKIE1hbnVlbAoKPiDCoFsuLi5dCg==

