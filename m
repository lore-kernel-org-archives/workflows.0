Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B499257ADD;
	Mon, 10 Feb 2025 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212729; cv=none; b=QE2aTx4347mNITi76EAahBuylb2/ACV/KbCgX/wlYFRecoBbszw/WtdOGc0kX1oOJrolFoFsAYeZfPZF+SbDq4ot7xygMT/0Ngp86dA5KfyVz5ntp4hg4D4biCox74bBQA7TfdkOrdbdBuYXiyOcEdMJuq6NVJMtwlFGI6kibkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212729; c=relaxed/simple;
	bh=c/kU0ksX8RTthjRctf9Bb5sGjeN8I+WkA0asudGrIy8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B1Y3iZfjfDRoyZvUJ63xUOAlq0CHgPOi8sNotj38HMP2QcAYSiP/l3EgoSOCoXdUr1587Wjx68YpY+zZ91ID4iyM2LZUAzYI/BiJS1dvQ40zGhm4fI6O+TZM0zCx02GtW81FkfJEApyNeO6+9XgHQS24AI3NmOobBZEQzbj5Nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=r53RTcx0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="r53RTcx0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1A7A0411A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739212727; bh=z/UYmWqnt59n7zmgNzr7atOIfm+REdMIrTqDXU8FW+E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r53RTcx0R85ZgZVoEZVxlaenb3R9SC+I8lSy+pAGR1dY4skqKoHCa/c7YWnqw4+T1
	 6T+TOeEZ9KuD0c2+DbSWMllr4/SHIEiSIVah6y9UVZoap6CevC0RcXDjPiJpwfNJX7
	 1ZTUoo+2lIYp+uZeLfN9b7XARtMXjaYADFtfjxPvkwkv7xrYJhlDT2K1RrAjz4qbyH
	 i3/r1Ey14vxaIU3OuRL9SrvW8KPBCzwLRsyxyXhIl62N77I/Ot7s+NhEb1sNt47iF+
	 QPayKwWNBLE8m2zDQWIcE6XT81N16/RecfIr+h+A+HcgJn8SpZIXMQqf0ED+Uglo55
	 kPXgBQ0YCL7KQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1A7A0411A1;
	Mon, 10 Feb 2025 18:38:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
In-Reply-To: <20250203174626.1131225-1-kuba@kernel.org>
References: <20250203174626.1131225-1-kuba@kernel.org>
Date: Mon, 10 Feb 2025 11:38:46 -0700
Message-ID: <87cyfpzlu1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> writes:

> Adding company name in round brackets to From/SoB lines
> is fairly common, but I don't see it documented anywhere.
> Every now and then people try to add the sponsorship lines
> to the commit message, fun example from this merge window:
>
>   Sponsored by:   The FreeBSD Foundation
>
> from commit 2ce67f8bf1ce ("wifi: iwlwifi: mvm: fix iwl_ssid_exist()
> check"). Better format would be:
>
>   Author: Miri Korenblit (FreeBSD Foundation) <...
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/submitting-patches.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation=
/process/submitting-patches.rst
> index 8fdc0ef3e604..12ed28b3d113 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` l=
ine is missing,
>  then the ``From:`` line from the email header will be used to determine
>  the patch author in the changelog.
>=20=20
> +The author may indicate their affiliation or the sponsor of the work
> +by adding the name of an organization to the ``from`` and ``SoB`` lines,
> +e.g.:
> +
> +	From: Patch Author (Company) <author@example.com>
> +
>  Explanation Body
>  ^^^^^^^^^^^^^^^^

So, despite all the conversation, I didn't see any real opposition to
adding this change, so I've applied it.

Amusingly, b4 helpfully picked up these tags from the conversation:

 + Signed-off-by: John Doe <jdoe@example.com> (=E2=9C=93DKIM/infradead.org)
 + Signed-off-by: Mr Maintainer <jdoe@example.com> (=E2=9C=93DKIM/kernel.or=
g)
 + Signed-off-by: Jane Maintainer <jdoe@example.com>

Tempting as it was to leave them in, I took them out :)

Thanks,

jon
