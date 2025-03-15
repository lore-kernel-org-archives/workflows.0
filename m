Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A91F5847
	for <workflows@vger.kernel.org>; Sat, 15 Mar 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742041313; cv=none; b=X5WhV8f0uyYjNQrsljPvTPxcH8y39y6Dlj+bTxiNjzk77Ce/RdJ5oMmCmMQ7+3yJ/OqkhS2wJgfjEjSdrff+CrZnbLk5SxeTJ/DWCIXy38GHweTQ6U21/V+ws7ILgcXdVIH27mQnJgp+oQrpariuXugw1tG46ad6Pwpnsqfl6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742041313; c=relaxed/simple;
	bh=wy6c20spWXmcS2DWIuXkVaGyvR3S8hTMEupyMxN48h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjA8kjkGbXWlj3FGnTCokbF2k4TcTZq8huWTZ5Hg8Pmg4OqWT49KI8JIt3P+MxNoVVsEG9buDCR3FGyTZWepXMXspyp1qsEA63XzfDiVq59zfn353EgaGcpSkeaIze+JPObhb/57eDWTfoWmxH1OuMtTq2+7IBLXZJC3z0kXPqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=lcEMBs7h; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="lcEMBs7h"
Message-ID: <9c6298a2-4efa-4f77-81c0-b2132f48c1b0@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742041308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pHhzfXW24TF1t1FOgMUb4yg/TvgoSuq5by1lc39Sis=;
	b=lcEMBs7hDHnSc0+QfxLmeZDIERK/dJY68x+llhQSLKp9G00S01R84WKw83XJyuvTMYeLMB
	8DF9YfNP5+MXAwlcgypmjk+GSuo93jaqX21XnnJ5xxx00ldRX8dqrFfwQK9NM0DJM2m0Mj
	DeygCKkWiBcK7/TouZY26iJWUm139hA1mbL9gi4YCxjIw4W0pz7kaE09y+KhAMebA1qPli
	2IWYBaEHlNcZBkuFC53V0susnEgNklY23VZgOffvT+FXiLUGSZfp+WIJhesX2iBbGCEPcH
	OlutoqHPbk9V0BZZtlNBrNLpKkywoHqByp09B6sMGS2jY7PU2iVNl63jS1ZLtg==
Date: Sat, 15 Mar 2025 13:21:43 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation: kcsan: fix "Plain Accesses and Data Races"
 URL in kcsan.rst
To: Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, dvyukov@google.com, elver@google.com,
 kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, workflows@vger.kernel.org
References: <1d66a62e-faee-4604-9136-f90eddcfa7c0@iencinas.com>
 <c6a697af-281a-4a91-8885-a4478dfe2cef@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <c6a697af-281a-4a91-8885-a4478dfe2cef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 15/3/25 3:41, Akira Yokosawa wrote:
> This might be something Jon would like to keep secret, but ...
> 
> See the message and the thread it belongs at:
> 
>     https://lore.kernel.org/lkml/Pine.LNX.4.44L0.1907310947340.1497-100000@iolanthe.rowland.org/
> 
> It happened in 2019 responding to Mauro's attempt to conversion of
> LKMM docs.
> 
> I haven't see any change in sentiment among LKMM maintainers since.

Thanks for the information!

> Your way forward would be to keep those .txt files *pure plain text"
> and to convert them on-the-fly into reST.  Of course only if such an
> effort sounds worthwhile to you.

With this you mean producing a .rst from the original .txt file using an 
script before building the documentation, right? I'm not sure how hard 
this is, but I can look into it.

> Another approach might be to include those docs literally.
> Similar approach has applied to
> 
>     Documentation/
> 	atomic_t.txt
> 	atomic_bitops.txt
>         memory-barriers.txt

Right, I got to [1]. 

It looks like there are several options here:

  A) Include the text files like in [1]
  B) Explore the "on-the-fly" translation
  C) Do A) and then B)

Does any of the above sound good, Jon?

Thank you both for your time

[1] https://lore.kernel.org/all/20220927160559.97154-7-corbet@lwn.net/
