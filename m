Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573A3939A3;
	Thu, 14 May 2026 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778781094; cv=none; b=gyvKJhmDUNRkyS+bglU/zrtLiKIcWtjOrMJasXYdnpaduZa3taf3D8mpJIj4+cpB4ClP/ZkxhC2wgqA6PElzAKH/fgT8CbHpEYbWED5N8H4pNXEFTQaLe59EHq+94N8JVphaUx55Kyj5F8QmMwojU/sL2Z22v22EAob37cHhANA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778781094; c=relaxed/simple;
	bh=upBY8nFB/QOOMdEBSeJUBWEbZV90IfFndhXk1eIBCRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkuvtLIG983U1CNE+4zBfAumMt2xMTUpNYNS4fn0tbZcQOFgek57/h50C9Lj3ivXPX8Gquke092rce/5x52wi2JhA/puzVsB3ON99hKJbAMYrszOe/Rt65qZHR4G9neUOG44Z3t8smKytwmX3Xb8aFnjP9dvy0B3iR5AQhwkKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BAO2gM7k; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BAO2gM7k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6zBo/4kUU64zyjiKhhX9l0fvv0Ag1b29EGM7ylNMm34=; b=BAO2gM7kOpbxPTgKDZ9Z0TGcW/
	3uSHb+PpWGMh0GD3FIVpKOzgyOavqE+dMMjBEPCdCYBuEKXQHm3Svpq0snZNn8suj1BsUDp5Mcl4e
	lYwPJegJYpvFEjoV6VBGfL1G6YGycF9NHuAjb6golTzmKlGTgAZd6IL9DN1hxV5bSgME0/0aMnUCq
	TKIOzSDsYtzz5nE2zZ2QYJlO6z3tvKO5aIbc4zW0ux1kT53w34ozYdA2ERJWQMeGPhDNQf46uynmI
	66eLzsAi/57RvafuHq83Hv8bwQ3qxaoTvMTJtrF0YMDmmv//K4YaFgu36Rc4LAD4YPM71x8uYsdCj
	y2axgZiw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaDM-00000006FQn-1OH1;
	Thu, 14 May 2026 17:51:16 +0000
Message-ID: <eb03a056-374b-4cce-b32d-c1b81f12e549@infradead.org>
Date: Thu, 14 May 2026 10:51:14 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
To: Kees Cook <kees@kernel.org>, Manuel Ebner <manuelebner@mailbox.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 David Laight <david.laight.linux@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514162652.107714-2-manuelebner@mailbox.org>
 <202605140931.913048A68B@keescook>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202605140931.913048A68B@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/14/26 9:31 AM, Kees Cook wrote:
> On Thu, May 14, 2026 at 06:26:53PM +0200, Manuel Ebner wrote:
>> add strlcat and alternatives
>>
>> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
>> ---
>>  Documentation/process/deprecated.rst | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
>> index fed56864d036..06e802f4bbfd 100644
>> --- a/Documentation/process/deprecated.rst
>> +++ b/Documentation/process/deprecated.rst
>> @@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
>>  attribute to avoid future compiler warnings. For cases still needing
>>  NUL-padding, strtomem_pad() can be used.
>>  
>> +strlcat()
>> +---------
>> +strlcat() must re-scan the destination string from the beginning on each
>> +call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
>> +snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
>> +of the arguments needs to be taken care off.
>> +
> 
> How about just:
> 
> strlcat() must re-scan the destination string from the beginning on each
> call (O(n^2) behavior). Use the seq_buf API or similar instead.
> 

Yeah, that avoids the "aswell" (should be "as well").

> 
>>  strlcpy()
>>  ---------
>>  strlcpy() reads the entire source buffer first (since the return value
>> -- 
>> 2.54.0
>>
> 

-- 
~Randy

