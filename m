Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869064;
	b=KyBfgtVbkIMP22OyKGtjwkFhTjCO21xjiuRK+cu/uxvJqttxdnJ4qR7Rw+L+vNhm6AZd
	 ZiOQ41lv5wO8SBKHIzbEQ7/49Fwwt/AFZFD71N4uQ9MFx/bJuRivOB6gcY48jXULFQ960
	 ugIipCrsyb6/+ftXrWiFqApBS/fH61EwO0EQj3mqXLXGsAB+IjiNBYuXi1ahzNqJDHxYE
	 aa1igNZwZztsImN/ww+bgmASkxOuRW2oork+vAQaP8ALyzkYXA7e1iBAgIlcAyNrmqZIf
	 Q01CTohnCXw1suvWu+ZPMoiWTPIrL5GhlQZF7rZHD3cRoNY1iF31/tH6z50tt1YwF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869064;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0J35juf+Q3wPkqJ/fEvR/SIaQikfoEpWGs87Fk8Zd4I=;
	b=mv79JKh33PINXzDbFyZVs7mgrJNl4ez20xH81SSbgg7iFcJqEEGQ7YFCf84giLYqsL+g
	 jeudWhsqtIaRu8FkryB5YxJGBskUMISd/4fyTqSwxAhomI/+1s+k5/UUmOcpgnany7f7m
	 7RGh9HKA8V7o8yRiTSzM4Gb2iVhGiLmc5wde9qwXKtNSkFi2/5A0ChWsVOmt9c5xaJkK7
	 gnVcDymVUreB9y6sz6mMJ+qJza3GtKaOqca2nF3DT16PNiwHzItpZ9EvByZlumSGNDt6b
	 ASakKFADi7foV0cbMfw1jTxxBLy4G4SRA6VQXTgxJflLPT2ASIGmwYWhTBg7IuqI/1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=jHpwiRQz;
	arc=none smtp.remote-ip=91.218.175.63
Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14A606A32D
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 08:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC14A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=jHpwiRQz
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cl508koB5a8RnOsym5lLE/Q8Iyz8NnCi/Q9gPQjRJbE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793869060; v=1; x=1794473860;
 b=jHpwiRQzQDFrOwTh+1KvLJo3LtHjwUXyPRM5LDgEyz9K7ZMRv5kUImDPOniaaXr5uRBxkFlm
 IxBeyzJbzZRVu9ymLOLqqfe7N58LvcDV7+VL5wVuXt+y3m+jQDVUdqq/d1DIgTf5fFH9mEOuJVf
 /LltGVInpNfNijQLiScRYwbGhWCogMcZEnBmUan20DUxkz4pLoE9nLpf8Jmz92WtAolaQsyBRGu
 KpcCi+l7xVCFA8M84SAA5e/zRlHYxgXKLQ1driTBsNrMkWMIQmDf2OSah0TMMX8XiJLvC5A65ko
 8S4MzQMhIFfRujCOnJmOffofQbycv9frS548t/BUeBhuA==
X-Envelope-To: workflows@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9cd18ad5c886574;
	Thu, 05 Nov 2026 08:57:40 +0000
X-Mizu-Trace-ID: c9cd18ad5c886574
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 16:57:33 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
Message-ID: <auxE_RJJKYf0gPlE@wyuan.org>
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auw_egkhHADKXL90@wyuan.org>
 <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> On 05/11/2026 09:34, Weijie Yuan wrote:
> > Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> > 
> >> Refactoring of driver subsystems or some core driver parts often come
> >> with change of the actual drivers.  If that happens within one patch,
> >> people giving "Reviewed-by" tag only to piece of the patch, like one
> >> driver, and ignoring entire rest including the main concept of the
> >> patch, are not really reviewing "the patch".
> >>
> >> As explained in Submitting Patches document, the "Reviewer's statement
> >> of oversight" is for patch:
> >>
> >>   (a) I have carried out a technical review of this patch to
> >>       evaluate its appropriateness and readiness for inclusion into
> >>       the mainline kernel.
> >>
> >> The sentence is complete, meaning it does not allow implicit variations
> >> "this patch or part of this patch".
> > 
> > Agreed.
> > 
> >> Reviewing pieces of patch while ignoring the main part of it, is
> >> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> >> not be applicable.
> > 
> > But in this case, I suspect that your "Acked-by" trailer will still be
> > interpreted as an ack of the entire patch in future git logs, rather
> > than a partial ack and/or a partial review.
> > 
> 
> Which would be fine, Acked-by has that meaning and no one really counts
> Acks or tracks Acks for any metrics or patch quality purposes.

;-) Also makes sense.

(I just posted my last one and found that v2 was also posted, what a
coincidence.)

Thanks!
