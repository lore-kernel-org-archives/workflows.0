Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7180391846;
	Thu, 26 Mar 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567650; cv=none; b=CRF8D/MXMyLdH0BTPT7N2uW17yp3m7V99/DX5y+fSivNdkPipXhDeEa95RgFZ3qkSvC9HMox/D5OmZ3TwfXwRhwZNDprDyqK7vTmAb+sv61HmOITgX1FBm9Mb16MfFP2ZvVrdT9mEvRCdwPnqH7cB9ylF0cEPPxj0VGH26QYMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567650; c=relaxed/simple;
	bh=FQZZyFZbb8ECaPObx9BVQbMrnHpwBeZoLxCyoOrWPEw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Be7jxzghJ78hb8Ywc17GCMHvHnFj9kBfRmfL+SMxojC4/jruzcmQSDbDSxvSpQqwQw4XK4FaPvaAb6/bmhtL6OEFFmAyV1/u/T8r8DsbCQt0QK0RLjx0oLBOm/34mPEFe6oMfvVqcjlrMV7WNtf5dUy+Z+YYj7Nc5GcShcJ8Dao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 61563BB9A9;
	Thu, 26 Mar 2026 23:27:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id AE55A20023;
	Thu, 26 Mar 2026 23:27:25 +0000 (UTC)
Message-ID: <213b7ea370ba1aac2b55bde6990965941e41c2be.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton
	 <akpm@linux-foundation.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 16:27:24 -0700
In-Reply-To: <acW9KGbNm8bLg-cr@google.com>
References: <acTPXMJfkHLeItrK@google.com>
	 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
	 <acVIBseRrqJI8Uwb@google.com>
	 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
	 <acWnbG3nGjfYeYXh@google.com>
	 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
	 <acW6Iar6XOzO9IfN@google.com>
	 <3217a61e50f7b9fd387b908c0907bd0bf889bebb.camel@perches.com>
	 <acW9KGbNm8bLg-cr@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 7e9yudfg3mew8rd3545ec8wawzjmuw91
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: AE55A20023
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18BHHZXI/+fKsg8wfDXgDIjPoi9ejVGwUg=
X-HE-Tag: 1774567645-813867
X-HE-Meta: U2FsdGVkX18B8l4cdSt1pRkWM36FHbJ2TYgU6ZcFei/YTOUtiA9B3z9iw8Qz9GdECiWZ9PoCQ7Jm4kQFy5ZfCPboULRTdO9NSsYF023P/PLsIlKmYOssCcBwiTJgnu3VvVmyOf6EP+AnZZ0+hR6zdALwBQ06CcrdLG5F/Otm3ryX9tcCjpcUKVGsbyDJ1A6sAsFkXsJe8L4U1ODrPwYURtPEplCP2TcDAeXuvnbhpWpQUoGkIL9veRfor05CYL7eU7oWDbzDNLgryHK307okmwUvnl+7BseBxOmL3of60MveqlbSmOKb4CJlIZ/o7F0Z

On Thu, 2026-03-26 at 16:19 -0700, Dmitry Torokhov wrote:
> On Thu, Mar 26, 2026 at 03:56:27PM -0700, Joe Perches wrote:
> I gave you feedback.  You elided it.
> > > Could you please point me to it? All I saw is "just save it"
> > Seems constructive to me.
> As constructive as "You're holding it wrong". I want to be able to run
> checkpatch as I am typing, not at some later time. My editor shows
> diagnostics as a virtual text, so it is quite confusing that the error
> is still shown even after I fixed the issue.
>=20
> It looks like I forgot to add akpm to CC, let me add him...

No worries.  nak.

It's not something I want to support.

cheers, Joe
