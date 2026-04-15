Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BBE30DEA5;
	Wed, 15 Apr 2026 02:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776218642; cv=none; b=UelpZiAYljDOZZ+cADmGe5bDW3zIVXMGQth5FKa7MxdQXxYMnkMQBBFcLRPLER2Qqi4nCMe+gh3LkJ8jVXwxvYpsKpldsxggOtOTAcJGvrNhhlhGC6FT5zqBlKG9geihSRsi1IgX4X3uwstg6Vg3vD4e6GOFDr4j5OZ54ckkgoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776218642; c=relaxed/simple;
	bh=DT4Jgx1yT3VjfVmjZAFYWDOOquLdY7pucSTSqYh4B/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kISbS2SZYPkywDm3nQ+5d4P5o9VU6RGudfsyq2dOPpWAP5mLbomMLg/yuWsuXnatdY2lOWZBiUqLceb3WRNygZpOkdss+9Ds4gt48dGDReBnIwP5dB5R3CeeMcz+xMkwq6zsNd1cfba7PvQxmcr19XO/dibnBRHSqWtujxRoYjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1j7lTHMx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1j7lTHMx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Cw7gnQwiMqn2efvFryvvAzImJrEoGsYfFoWuwuNEl0c=; b=1j7lTHMxmbZ4TYq3zDTXo+nac4
	qkyjdZDvL2hwu3t8sN03weqql3Znl8NrTjAdgdS1kqsinZ1fmqC158YnJ/WC6hKiihY8gkjH3GCx+
	rU6qjzQP69p1rcLD3QlsP+7cTtyDnGZoaea1DDSgJRfvz0mnVIxXRlOGJcHy3pbji1IKEm2mf7yJm
	JeQcTQcu3GluS0KRLt0oUOhZN34CiFgP7khUEsP7NvHS7sixmS3/2FVtqIW9ADElmwv210bDzPSuT
	MywqTPXD2P8htB9Sh7chgsrmYnx6Y67CZmpZ7JXP09PbP7CYX4y+wFNWr2SESm+sXqmtvsjRDXKd1
	0heRGdqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpbd-00000000T1J-43PM;
	Wed, 15 Apr 2026 02:03:54 +0000
Message-ID: <31369e1c-91c2-4cda-9175-c2661a7d5a82@infradead.org>
Date: Tue, 14 Apr 2026 19:03:53 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: maintainer profiles
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
 <72a4accd-5f94-45f7-8392-bb659167f078@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <72a4accd-5f94-45f7-8392-bb659167f078@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/14/26 4:18 AM, Krzysztof Kozlowski wrote:
> On 10/04/2026 02:18, Randy Dunlap wrote:
>> Hi,
>>
>> Is there supposed to be a difference (or distinction) in the contents of
>>
>> Documentation/process/maintainer-handbooks.rst
>> and
>> Documentation/maintainer/maintainer-entry-profile.rst
>> ?
>>
>> Can they be combined into one location?
> 
> Yes, please! Including also the location of actual profiles. I am mostly
> looking at them in the sources directly, not web docs, so confusing and
> annoying to find them distributed.

I agree completely but I'm not sure if anyone else does.

-- 
~Randy

